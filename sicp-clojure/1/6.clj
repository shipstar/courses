(defn square [x]
  (* x x)
)

(defn improve [guess x]
  (double (/ (+ (/ x (square guess)) (* 2 guess)) 3))
)

(defn good-enough? [guess new-guess]
  (< (Math/abs (- guess new-guess)) 0.000000000001)
)

(defn cube-root-iter [guess x]
  (let [new-guess (improve guess x)]
    (if (good-enough? guess new-guess)
      guess
      (cube-root-iter new-guess x))
  )
)

(defn cube-root [x]
  (cube-root-iter 1 x)
)