# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
namespace eval ::optrace {
  variable script "C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_5/msys_wrapper.tcl"
  variable category "vivado_impl"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    } elseif { [info exist ::env(HOST)] } {
      set host $::env(HOST)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
OPTRACE "impl_5" END { }
}


OPTRACE "impl_5" START { ROLLUP_1 }
OPTRACE "Phase: Init Design" START { ROLLUP_AUTO }
start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param chipscope.maxJobs 6
  set_param runs.launchOptions { -jobs 24  }
OPTRACE "create in-memory project" START { }
  create_project -in_memory -part xc7a100tcsg324-2
  set_property board_part_repo_paths {C:/Users/kharp/Desktop/test_board/board_files} [current_project]
  set_property board_part trenz.biz:te0725_100_2i:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
OPTRACE "create in-memory project" END { }
OPTRACE "set parameters" START { }
  set_property webtalk.parent_dir C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.cache/wt [current_project]
  set_property parent.project_path C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.xpr [current_project]
  set_property ip_repo_paths {
  C:/Users/kharp/Desktop/soundSteering_halfLUTs/IP
  C:/Users/kharp/Desktop/soundSteering
} [current_project]
  update_ip_catalog
  set_property ip_output_repo C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
OPTRACE "set parameters" END { }
OPTRACE "add files" START { }
  add_files -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/synth_5/msys_wrapper.dcp
  set_msg_config -source 4 -id {BD 41-1661} -limit 0
  set_param project.isImplRun true
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_64/blk_mem_gen_1_1_64.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_63/blk_mem_gen_1_1_63.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_62/blk_mem_gen_1_1_62.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_61/blk_mem_gen_1_1_61.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_60/blk_mem_gen_1_1_60.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_59/blk_mem_gen_1_1_59.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_58/blk_mem_gen_1_1_58.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_57/blk_mem_gen_1_1_57.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_56/blk_mem_gen_1_1_56.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_55/blk_mem_gen_1_1_55.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_54/blk_mem_gen_1_1_54.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_53/blk_mem_gen_1_1_53.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_52/blk_mem_gen_1_1_52.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_51/blk_mem_gen_1_1_51.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_50/blk_mem_gen_1_1_50.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_49/blk_mem_gen_1_1_49.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_48/blk_mem_gen_1_1_48.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_47/blk_mem_gen_1_1_47.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_46/blk_mem_gen_1_1_46.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_45/blk_mem_gen_1_1_45.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_44/blk_mem_gen_1_1_44.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_43/blk_mem_gen_1_1_43.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_42/blk_mem_gen_1_1_42.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_41/blk_mem_gen_1_1_41.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_40/blk_mem_gen_1_1_40.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_39/blk_mem_gen_1_1_39.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_38/blk_mem_gen_1_1_38.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_37/blk_mem_gen_1_1_37.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_36/blk_mem_gen_1_1_36.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_35/blk_mem_gen_1_1_35.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_34/blk_mem_gen_1_1_34.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_33/blk_mem_gen_1_1_33.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_32/blk_mem_gen_1_1_32.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_31/blk_mem_gen_1_1_31.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_30/blk_mem_gen_1_1_30.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_29/blk_mem_gen_1_1_29.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_28/blk_mem_gen_1_1_28.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_27/blk_mem_gen_1_1_27.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_26/blk_mem_gen_1_1_26.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_25/blk_mem_gen_1_1_25.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_24/blk_mem_gen_1_1_24.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_23/blk_mem_gen_1_1_23.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_22/blk_mem_gen_1_1_22.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_21/blk_mem_gen_1_1_21.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_20/blk_mem_gen_1_1_20.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_19/blk_mem_gen_1_1_19.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_18/blk_mem_gen_1_1_18.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_17/blk_mem_gen_1_1_17.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_16/blk_mem_gen_1_1_16.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_15/blk_mem_gen_1_1_15.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_14/blk_mem_gen_1_1_14.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_13/blk_mem_gen_1_1_13.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_12/blk_mem_gen_1_1_12.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_11/blk_mem_gen_1_1_11.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_10/blk_mem_gen_1_1_10.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_9/blk_mem_gen_1_1_9.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_8/blk_mem_gen_1_1_8.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_7/blk_mem_gen_1_1_7.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_6/blk_mem_gen_1_1_6.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_5/blk_mem_gen_1_1_5.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_4/blk_mem_gen_1_1_4.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_3/blk_mem_gen_1_1_3.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_2/blk_mem_gen_1_1_2.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_1_1_1/blk_mem_gen_1_1_1.xci
  read_ip -quiet C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
  add_files C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/bd/msys/msys.bd
  set_param project.isImplRun false
  add_files C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/imports/Desktop/soundSteering/fw/soundSteering_fw_04_16/build/soundSteering_fw_04_16.elf
  set_property SCOPED_TO_REF msys [get_files -all C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/imports/Desktop/soundSteering/fw/soundSteering_fw_04_16/build/soundSteering_fw_04_16.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/sources_1/imports/Desktop/soundSteering/fw/soundSteering_fw_04_16/build/soundSteering_fw_04_16.elf]
OPTRACE "read constraints: implementation" START { }
  read_xdc C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/constrs_2/imports/constraints/_i_bitgen_common.xdc
  read_xdc C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/constrs_2/imports/constraints/vivado_target.xdc
OPTRACE "read constraints: implementation" END { }
OPTRACE "read constraints: implementation_pre" START { }
OPTRACE "read constraints: implementation_pre" END { }
OPTRACE "add files" END { }
OPTRACE "link_design" START { }
  set_param project.isImplRun true
  link_design -top msys_wrapper -part xc7a100tcsg324-2 
OPTRACE "link_design" END { }
  set_param project.isImplRun false
OPTRACE "gray box cells" START { }
OPTRACE "gray box cells" END { }
OPTRACE "init_design_reports" START { REPORT }
OPTRACE "init_design_reports" END { }
OPTRACE "init_design_write_hwdef" START { }
OPTRACE "init_design_write_hwdef" END { }
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Init Design" END { }
OPTRACE "Phase: Opt Design" START { ROLLUP_AUTO }
start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
OPTRACE "read constraints: opt_design" START { }
OPTRACE "read constraints: opt_design" END { }
OPTRACE "opt_design" START { }
  opt_design -directive ExploreArea
OPTRACE "opt_design" END { }
OPTRACE "read constraints: opt_design_post" START { }
OPTRACE "read constraints: opt_design_post" END { }
OPTRACE "opt_design reports" START { REPORT }
  create_report "impl_5_opt_report_drc_0" "report_drc -file msys_wrapper_drc_opted.rpt -pb msys_wrapper_drc_opted.pb -rpx msys_wrapper_drc_opted.rpx"
OPTRACE "opt_design reports" END { }
OPTRACE "Opt Design: write_checkpoint" START { CHECKPOINT }
  write_checkpoint -force msys_wrapper_opt.dcp
OPTRACE "Opt Design: write_checkpoint" END { }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Opt Design" END { }
OPTRACE "Phase: Place Design" START { ROLLUP_AUTO }
start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
OPTRACE "read constraints: place_design" START { }
OPTRACE "read constraints: place_design" END { }
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
OPTRACE "implement_debug_core" START { }
    implement_debug_core 
OPTRACE "implement_debug_core" END { }
  } 
OPTRACE "place_design" START { }
  place_design 
OPTRACE "place_design" END { }
OPTRACE "read constraints: place_design_post" START { }
OPTRACE "read constraints: place_design_post" END { }
OPTRACE "place_design reports" START { REPORT }
  create_report "impl_5_place_report_io_0" "report_io -file msys_wrapper_io_placed.rpt"
  create_report "impl_5_place_report_utilization_0" "report_utilization -file msys_wrapper_utilization_placed.rpt -pb msys_wrapper_utilization_placed.pb"
  create_report "impl_5_place_report_control_sets_0" "report_control_sets -verbose -file msys_wrapper_control_sets_placed.rpt"
OPTRACE "place_design reports" END { }
OPTRACE "Place Design: write_checkpoint" START { CHECKPOINT }
  write_checkpoint -force msys_wrapper_placed.dcp
OPTRACE "Place Design: write_checkpoint" END { }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

OPTRACE "Phase: Place Design" END { }
OPTRACE "Phase: Route Design" START { ROLLUP_AUTO }
start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
OPTRACE "read constraints: route_design" START { }
OPTRACE "read constraints: route_design" END { }
OPTRACE "route_design" START { }
  route_design 
OPTRACE "route_design" END { }
OPTRACE "read constraints: route_design_post" START { }
OPTRACE "read constraints: route_design_post" END { }
OPTRACE "route_design reports" START { REPORT }
  create_report "impl_5_route_report_drc_0" "report_drc -file msys_wrapper_drc_routed.rpt -pb msys_wrapper_drc_routed.pb -rpx msys_wrapper_drc_routed.rpx"
  create_report "impl_5_route_report_methodology_0" "report_methodology -file msys_wrapper_methodology_drc_routed.rpt -pb msys_wrapper_methodology_drc_routed.pb -rpx msys_wrapper_methodology_drc_routed.rpx"
  create_report "impl_5_route_report_power_0" "report_power -file msys_wrapper_power_routed.rpt -pb msys_wrapper_power_summary_routed.pb -rpx msys_wrapper_power_routed.rpx"
  create_report "impl_5_route_report_route_status_0" "report_route_status -file msys_wrapper_route_status.rpt -pb msys_wrapper_route_status.pb"
  create_report "impl_5_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -report_unconstrained -file msys_wrapper_timing_summary_routed.rpt -pb msys_wrapper_timing_summary_routed.pb -rpx msys_wrapper_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_5_route_report_incremental_reuse_0" "report_incremental_reuse -file msys_wrapper_incremental_reuse_routed.rpt"
  create_report "impl_5_route_report_clock_utilization_0" "report_clock_utilization -file msys_wrapper_clock_utilization_routed.rpt"
  create_report "impl_5_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file msys_wrapper_bus_skew_routed.rpt -pb msys_wrapper_bus_skew_routed.pb -rpx msys_wrapper_bus_skew_routed.rpx"
OPTRACE "route_design reports" END { }
OPTRACE "Route Design: write_checkpoint" START { CHECKPOINT }
  write_checkpoint -force msys_wrapper_routed.dcp
OPTRACE "Route Design: write_checkpoint" END { }
OPTRACE "route_design misc" START { }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
OPTRACE "route_design write_checkpoint" START { CHECKPOINT }
OPTRACE "route_design write_checkpoint" END { }
  write_checkpoint -force msys_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

OPTRACE "route_design misc" END { }
OPTRACE "Phase: Route Design" END { }
OPTRACE "impl_5" END { }