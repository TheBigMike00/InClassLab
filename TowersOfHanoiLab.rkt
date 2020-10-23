;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname TowersOfHanoiLab) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;towers -> 3 disks (operates like stack)
;disk (number or symbol)
(define displayTower
  (lambda (tower)
     (cdr tower)))

(define newTower
  (lambda (d1 d2 d3)
    (list 'tower d1 d2 d3)))

(define emptyTower
  (lambda ()
    (list 'tower '())))

(define initGame
  (lambda (tower1 tower2 tower3)
    (list tower1 tower2 tower3)))

(define isLegal?
  (lambda (source destination)
    (cond
      ((eq? (cadr source) '()) #f)
      ((eq? (cadr destination) '()) #t)
      ((> (cadr destination) (cadr source)) #f)
      (else #t))))

(define getTower1
  (lambda (gameBoard)
    (car gameBoard)))

(define getTower2
  (lambda (gameBoard)
    (cadr gameBoard)))

(define getTower3
  (lambda (gameBoard)
    (caddr gameBoard)))

(define numToTower
  (lambda (gameBoard num)
    (cond
      ((= num 1) (getTower1 gameBoard))
      ((= num 2) (getTower2 gameBoard))
      ((= num 3) (getTower3 gameBoard)))))

(define makeMove
  (lambda (gameBoard sourceTower destinationTower)
    (if(isLegal? (numToTower gameBoard sourceTower) (numToTower gameBoard destinationTower))
       (cond
         ((and(= sourceTower 1) (= destinationTower 2)) (list(list 'tower (cddr (car gameBoard))) (list 'tower (cadr (car gameBoard)) (cdr(cadr gameBoard))) (caddr gameBoard)) )
         ((and(= sourceTower 1) (= destinationTower 3)) (list(list 'tower (cddr (car gameBoard))) (cadr gameBoard) (list 'tower (cadr (car gameBoard)) (cdr(caddr gameBoard)))))
         ((and(= sourceTower 2) (= destinationTower 1)) (list (list 'tower (cadr (cadr gameBoard)) (cdr(car gameBoard))) (list 'tower (cddr (cadr gameBoard))) (caddr gameBoard)))
         ((and(= sourceTower 2) (= destinationTower 3)) (list(car gameBoard) (list 'tower (cddr (cadr gameBoard))) (list 'tower (cadr (cadr gameBoard)) (cdr(caddr gameBoard)))))
         ((and(= sourceTower 3) (= destinationTower 1)) (list(list 'tower (cadr (caddr gameBoard)) (cdr(car gameBoard))) (cadr gameBoard) (list 'tower (cddr (caddr gameBoard)))))
         ((and(= sourceTower 3) (= destinationTower 2)) (list(car gameBoard) (list 'tower (cadr (caddr gameBoard)) (cdr(cadr gameBoard))) (list 'tower (cddr (caddr gameBoard))))))
       (display '(This aint it chief)))))

(define isWinner
  (lambda (gameBoard)
    (if(and(null? (cdr gameBoard)) (null? (cdr gameBoard))) 
       #t
       #f)))

(define tower1 (newTower 1 2 3))
(define tower2 (emptyTower))
(define tower3 (emptyTower))
(define gameBoard (initGame tower1 tower2 tower3))
;(display gameBoard)
(display(makeMove gameBoard 1 3))
