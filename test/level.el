(require 'log4e)
(require 'el-expectations)


(expectations
  (desc "level default")
  (expect "test for fatal.\ntest for error.\ntest for warn.\ntest for info.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "level set level")
  (expect "test for fatal.\ntest for error.\ntest for warn.\ntest for info.\ntest for debug.\ntest for trace.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'trace)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "level set level with maxlevel")
  (expect "test for warn.\ntest for info.\ntest for debug.\ntest for trace.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'trace 'warn)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "level set level value typo 1")
  (expect "test for fatal.\ntest for error.\ntest for warn.\ntest for info.\ntest for debug.\ntest for trace.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'debag)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "level set level value typo 2")
  (expect "test for fatal.\ntest for error.\ntest for warn.\ntest for info.\ntest for debug.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'debug 'errrr)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "level set level value reverse")
  (expect ""
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (makunbound 'log4e--min-level-hoge)
    (makunbound 'log4e--max-level-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'trace)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for fatal.")
    (hoge--log-error "test for error.")
    (hoge--log-warn  "test for warn.")
    (hoge--log-info  "test for info.")
    (hoge--log-debug "test for debug.")
    (hoge--log-trace "test for trace.")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

