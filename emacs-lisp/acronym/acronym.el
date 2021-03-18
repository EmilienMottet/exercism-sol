;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun acronym (str)
  (upcase (mapconcat (lambda (s) (substring s
                                            0
                                            1))
                     (split-string str
                                   "[- \f\t\n\r\v]+")
                     "")))

(provide 'acronym)
;;; acronym.el ends here
