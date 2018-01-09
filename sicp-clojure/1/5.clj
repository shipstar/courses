; examples stolen from someone else

(defn average [x y]
  (double (/ (+ x y) 2))
)

(defn square [x]
  (* x x)
)

(defn improve [guess x]
  (average guess (/ x guess))
)

; Original
(defn good-enough? [guess x]
  (< (Math/abs (- (square guess) x)) 0.001)
)

(defn sqrt-iter [guess x]
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
  )
)

(defn sqrt [x]
  (sqrt-iter 1 x)
)

(sqrt (square 0.001)) ; 0.031260655525445276
(sqrt 1e13) ; StackOverflow

; Revised
(defn alt-good-enough? [guess new-guess]
  (< (Math/abs (- guess new-guess)) 0.00001)
)

(defn alt-sqrt-iter [guess x]
  (let [new-guess (improve guess x)]
    (if (alt-good-enough? guess new-guess)
      guess
      (alt-sqrt-iter new-guess x))
  )
)

(defn alt-sqrt [x]
  (alt-sqrt-iter 1 x)
)

(alt-sqrt (square 0.001)) ; 0.0010005538710539446
(alt-sqrt 1e13) ; 3162277.6601683795