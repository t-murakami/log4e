(require 'log4e)
(require 'el-expectations)


(expectations
  (desc "move next log")
  (expect "It's debug\nIt's error\nIt's trace\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'trace)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "It's fatal\nIt's unknown\nIt's dummy")
    (hoge--log-debug "It's debug\nIt's hoge\nIt's fuga")
    (hoge--log-error "It's error\nIt's bar")
    (hoge--log-trace "It's trace")
    (with-current-buffer " *log4e-hoge*"
      (goto-char (point-min))
      (let* ((ret ""))
        (while (and (< (point) (point-max))
                    (log4e:next-log))
          (setq ret (concat ret (buffer-substring-no-properties (point-at-bol) (point-at-eol)) "\n")))
        ret))))

(expectations
  (desc "move previous log")
  (expect "It's trace\nIt's error\nIt's debug\nIt's fatal\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'trace)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "It's fatal\nIt's unknown\nIt's dummy")
    (hoge--log-debug "It's debug\nIt's hoge\nIt's fuga")
    (hoge--log-error "It's error\nIt's bar")
    (hoge--log-trace "It's trace")
    (with-current-buffer " *log4e-hoge*"
      (goto-char (point-max))
      (let* ((ret ""))
        (while (and (> (point) (point-min))
                    (log4e:previous-log))
          (setq ret (concat ret (buffer-substring-no-properties (point-at-bol) (point-at-eol)) "\n")))
        ret))))

