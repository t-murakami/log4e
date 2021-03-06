;; -*- coding: utf-8 -*-

(require 'log4e)
(require 'el-expectations)

(expectations
  (desc "msgarg string")
  (expect "test for 'hoge'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." "hoge")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg nil")
  (expect "test for 'nil'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." nil)
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg t")
  (expect "test for 't'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." t)
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg list")
  (expect "test for '(hoge nil t)'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." '("hoge" nil t))
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg string within special char")
  (expect "test for 'hoge fuga\\bar'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." "hoge\0fuga\\bar")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))
   
(expectations
  (desc "msgarg japanese")
  (expect "test for 'これは試験ﾃﾞｽ'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." "これは試験ﾃﾞｽ")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))
   
(expectations
  (desc "msgarg string within japanese")
  (expect "test for 'This is 試験ﾃﾞｽ　Yo!'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s'." "This is 試験ﾃﾞｽ　Yo!")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))
   
(expectations
  (desc "msgarg quoted string")
  (expect "test for '\"hoge\"'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%S'." "hoge")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg quoted string within special char")
  (expect "test for '\"hoge fuga\\\\bar\"'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%S'." "hoge\0fuga\\bar")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))
   
(expectations
  (desc "msgarg integer")
  (expect "test for '52'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%d'." 52)
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg double")
  (expect "test for '3.140000'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%f'." 3.14)
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg wrong type")
  (expect "test for '=Format specifier doesn't match argument type='.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%d'." "52")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

(expectations
  (desc "msgarg mix")
  (expect "test for 'hoge', '52', '3.140000', '\"fuga\"'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s', '%d', '%f', '%S'." "hoge" 52 3.14 "fuga")
    (with-current-buffer " *log4e-hoge*"
     (buffer-string))))

(expectations
  (desc "msgarg mix within wrong type")
  (expect "test for 'hoge', '=Format specifier doesn't match argument type=', '3.140000', '\"fuga\"'.\n"
    (makunbound 'log4e--log-templete-hoge)
    (makunbound 'log4e--time-templete-hoge)
    (log4e:deflogger "hoge" "%m" "%S")
    (hoge--log-set-level 'fatal 'fatal)
    (hoge--log-enable-logging)
    (hoge--log-clear-log)
    (hoge--log-fatal "test for '%s', '%d', '%f', '%S'." "hoge" "52" 3.14 "fuga")
    (with-current-buffer " *log4e-hoge*"
      (buffer-string))))

