;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun armstrong-p (num)
  (eq (apply '+
             (mapcar (lambda (d) (expt (- d
                                          ?0)
                                       (+ (truncate (log10 num))
                                          1)))
                     (number-to-string num)))
      num)
  )

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
