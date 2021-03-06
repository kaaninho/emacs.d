(load "timeclock.el")

(defun timeclock-sum-all-hours ()
  (interactive)
  (let ((days (timeclock-day-alist (timeclock-log-data)))
	(total 0.0))
    (while days
      (setq total (+ total (timeclock-day-length (cdar days)))
	    days (cdr days)))
    (message (timeclock-seconds-to-string total))))

(defun timeclock-overtime ()
  (interactive)
  (let* ((work-hours-per-day 6)
	 (days (timeclock-day-alist (timeclock-log-data)))
	 (worked-days-number (length days))
	 (total 0.0))
    (while days
      (setq total (+ total (timeclock-day-length (cdar days)))
	    days (cdr days)))
    (message (timeclock-seconds-to-string
	      (- total (* 3600 work-hours-per-day worked-days-number))))))


(defun timeclock-hours-worked-today ()
  (interactive)
  (let ((today (car (timeclock-day-alist (timeclock-log-data)))))
    (message (timeclock-seconds-to-string (timeclock-day-length today)))))


(defun timeclock-open-timelog-file ()
  (interactive)
  (find-file "~/.emacs.d/timelog")
  (goto-char (point-max)))


;;; For printing out elements

;; (setq theq nil)

;; (defun eat-it (c)
;;   (setq theq (cons c theq)))

;; (defun print-it (el)
;;   (print el 'eat-it)
;;   (insert (concat (nreverse theq))))

;; (print-it (car (timeclock-day-alist (timeclock-log-data))))
