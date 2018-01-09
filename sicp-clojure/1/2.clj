(defn sum-of-squares [a b]
  (+ (* a a) (* b b))
)

(defn sum-of-two-largest-squares [a b c]
  (cond (and (<= a b) (<= a c)) (sum-of-squares b c)
        (and (<= b c) (<= b a)) (sum-of-squares a c)
        :else (sum-of-squares a b)
  )
)