;;; prime-number.el -- Dashboard -*- lexical-binding: t -*-

;; Copyright (C) 2024 Agung Tuanany

;; Author: Agung Tuanany <agung.tuanany@gmail.com>
;; URL:https://github.com/agungTuanany/ossu-introduction-to-mathematical-thinking
;; Package-Requires: none
;; Created: 2024
;; Version: 0.1.0
;; Keywords: dashboard

;;;; Package-Requires:

;;;; License:
;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 or the License, or any later version.

;; This program is distributed in the hope it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITINES FOR
;; A PARTICULAR PURPOSE. See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License along with
;; this program.  If not, see <https://www.gnu.org/licenses/>.

;;;; Commentary:

;;;; Code:
;; Define the algorithm in LISP functional programming principles

;; function to check if a number is divisible
(defun divisible-p (n divisor)
  "Check if 'N' is divisible by 'DIVISOR'."
  (= (mod n divisor) 0)
  )

;; function to check if a number is prime
(defun prime-p (n)
  "Check if 'N' is a prime number."

  (if (<= n 1)
      nil
    (let ((is-prime t))
      ;; (message "[debug-let is prime] the n is %d; and is-prime is %s" n is-prime)
      (dotimes (i (- n 2) is-prime)
      ;; (message "[debug-dotimes] the n is [%d]; and the i is [%d]" n i)
      (message "[debug-dotimes] the n is [%d]; and the i is [%s]" n divisible-p)
        (when (and (> i 0) (divisible-p n (+ i 2)))
          (message "[debug-when] ... ...")
          (message "[debug-when] the n is [%d]; and the i is [%d]" n i)
          (setq is-prime nil))))))

;; function to find prime numbers in a given range
(defun find-primes-in-range (start end)
  "Find all prime numbers in the range from 'START' to 'END'."
  (let (primes)
    (dotimes (i (- end start -1))
      ;; (message "primes is %d %d are %s" end start primes)
      (let ((num (+ start i)))
        (when (prime-p num)
          (push num primes))))
    (reverse primes)))

;; function to print the prime numbers in the specified range
(defun print-primes-in-range (start end)
  "Print all prime numbers in the range from 'START' to 'END'."

  (let ((primes (find-primes-in-range start end)))
    (message "Prime number between %d and %d: %s" start end primes)))

;; Main function to find and print prime numbers between 20 and 25
(defun main-prime-number ()
  "Main function to find and print prime numbers between 20 and 25."
  (interactive)
  (print-primes-in-range 1 5))

;; Execute the main function
(main-prime-number)



;;; prime-number.el ends here
