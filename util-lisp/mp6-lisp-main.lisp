
(defun slurp (filename) 
  (format nil "~{~a~%~}" 
    (with-open-file (s filename)
      (loop for line = (read-line s nil nil)
            while line
            collect line into lines
            finally (return lines)))))

(let (source (pos 0) p)
    (if (sv-eq (elt *mp6-args* 1) "-e")
        (setf source (elt *mp6-args* 2))
        (setf source (slurp (elt *mp6-args* 1))))
    ;; (format t "~a" source)
    (sv-say (list ";; Do not edit this file - Generated by MiniPerl6 3.0" ))
    (loop while (< pos (length source)) 
          do (progn
             (setf p (sv-comp_unit (proto-mp-MiniPerl6-Grammar) source pos))
             ;; (format t "~a~%" (sv-perl p))
             (format t "~a~%" (sv-emit_lisp (sv-capture p)))
             ;; (sv-say (list ";; at source pos: " (sv-to p) " source end: " (length source)))
             (setf pos (sv-to p)))))


