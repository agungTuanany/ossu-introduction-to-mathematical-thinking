;;; check-prime-number-original.el -- Dashboard -*- lexical-binding: t -*-

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
;; Question:
;; How would you show that not every number of the form (N = (p1 · p2 · p3 · ... · pn) + 1)
;; is prime, where (p1, p2, p3, ..., pn) is the list of all prime numbers?
;;
;; Process:
;; 1. prime-p function:
;; - correctly checks for prime numbers by iterating up to the square root of 'n'
;; 2. generate-prime function:
;; - generates a list of the first 'count' prime numbers
;; 3. product-of-list function:
;; - calculates the product of a list of numbers
;; 4. calculate-n function:
;; - computes the product of the first 'n' primes and adds 1.
;;
;; Expected output:
;; The output should demonstrate the correct calculation where:
;; (2 . 3 . 5 .7 . 11 = 2310) and adding 1 gives 2311

(defun prime-p (n)
  "Check if N is a prime number."
  (if (<= n 1)
      nil
    (let ((is-prime t)
          (limit (floor (sqrt n))))
      (dotimes (i (- limit 1) is-prime)
        (when (zerop (% n (+ i 2)))
          (setq is-prime nil))))))

;; Test the prime-p function
(prime-p 11)  ;; Should return t
(prime-p 10)  ;; Should return nil


;; Function to generate the first n prime numbers
(defun generate-primes (count)
  "Generate a list of the first COUNT prime numbers."
  (let ((primes '())
        (num 2))
    (while (< (length primes) count)
      (when (prime-p num)
        (push num primes))
      (setq num (1+ num)))
    (reverse primes)))

;; Function to calculate the product of a list of numbers
(defun product-of-list (numbers)
  "Calculate the product of a list of NUMBERS."
  (let ((product 1))
    (dolist (number numbers product)
      (setq product (* product number)))))

;; Function to calculate N
(defun calculate-n (n)
  "Calculate N = (p1 * p2 * ... * pn) + 1 for the first N prime numbers."
  (interactive)
  (let* ((primes (generate-primes n))
         (product (product-of-list primes)))
    (1+ product)))

;; Example usage
;; Calculate for the first 5 primes
(calculate-n 5)



;;; check-prime-number-original.el ends here
