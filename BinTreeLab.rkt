;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname BinTreeLab) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;In-Class Lab
(define leaf
  (lambda ()
    '()))

(define at-leaf?
  null?)

(define num->binTree
  (lambda (num)
    (create num (leaf) (leaf))))

(define insertLSON
  (lambda (num binTree)
    (list (currentEl binTree) (create num (leaf) (leaf)) (getRSon binTree))))

(define insertRSON
  (lambda (num binTree)
    (list (currentEl binTree) (getLSon binTree) (create num (leaf) (leaf))))) 

(define create
  (lambda (num lson rson)
    (list num lson rson)))

(define currentEl
  (lambda (binTree)
    (car binTree)))

(define getLSon
    cadr)

(define getRSon
    caddr)

(define tree (num->binTree 13))
(define tree1(insertLSON 7 tree))
(insertRSON 9 tree1)