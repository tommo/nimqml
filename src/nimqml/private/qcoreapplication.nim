type
  QCoreApplicationEventFlag* = enum
    processAllEvents
    excludeUserInputEvents
    processExcludeSocketNotifiers
    processAllEventsWaitForMoreEvents
proc applicationDirPath*(app: QCoreApplication): string =
  let str = dos_qcoreapplication_application_dir_path()
  result = $str
  dos_chararray_delete(str)

proc processEvents*(app: QCoreApplication, flag: QCoreApplicationEventFlag ) =
  dos_qcoreapplication_process_events(cast[DosQEventLoopProcessEventFlag](flag))

proc processEvents*(app: QCoreApplication, flag: QCoreApplicationEventFlag, ms: int ) =
  dos_qcoreapplication_process_events_timed(cast[DosQEventLoopProcessEventFlag](flag), ms.cint)
