if { ![info exists env(VIVADO_DESIGN_NAME)] } {
    puts "Please set the environment variable VIVADO_DESIGN_NAME before running the script"
    return
}
set design_name $::env(VIVADO_DESIGN_NAME)
puts "Using design name: ${design_name}"

if { ![info exists env(VIVADO_TOP_NAME)] } {
    puts "No top design defined. Using the default top name ${design_name}_wrapper"
    set top_name ${design_name}_wrapper
} else {
  set top_name $::env(VIVADO_TOP_NAME)
  puts "Using top name: ${top_name}"
}

# change here if you want to change the systhesis step. 
# check the command 'launch_runs' learn more
# the valid steps are:
#  - opt_design, power_opt_design, place_design, route_design, phys_opt_design, and write_bitstream
set synthesis_step opt_design

# open the project
open_project ./vivado/${design_name}/${design_name}.xpr
# check whether this design has any source files. If not, then there is no need for synthesis
set source_files [get_files -of_objects [get_filesets sources_1]]
set has_source 0
foreach source_file $source_files {
  set extension [string tolower [file extension $source_file]]
  if {$extension == ".vhd" || $extension == ".v" || $extension == ".sv"} {
    set has_source 1
    break
  } 
}
# it does the synthesis only if there is any source file
if {$has_source == 1} {
    puts "======================================="
    puts "Synthesis initiated ..."
    puts "======================================="
    update_compile_order -fileset sources_1
    reset_run -quiet impl_1
    launch_runs impl_1 -to_step $synthesis_step -jobs 8
    wait_on_run impl_1
} else {
    puts "======================================="
    puts "There is no HDL file to be synthesized"
    puts "======================================="
}

# If the src dir has not apps to be compiled, then this is a hardware only project.
# no need to export the hardware to SDK and to run SDK
set app_list [glob -nocomplain -type d -dir src "*"]
if {[llength $app_list] != 0} {
    # exporting hw design to SDK
    file mkdir ./vivado/${design_name}/${design_name}.sdk
    file copy -force ./vivado/${design_name}/${design_name}.runs/impl_1/${top_name}.sysdef ./vivado/${design_name}/${design_name}.sdk/${design_name}.hdf
    puts "========================"
    puts "Hardware exported to SDK"
    puts "========================"
} else {
    puts "==================================="
    puts "There is no software to be compiled"
    puts "==================================="
}

close_design -quiet
