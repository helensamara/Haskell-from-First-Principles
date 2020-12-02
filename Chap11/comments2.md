## 11.8 What makes these datatypes algebraic?

- code:

```haskell
  data Example = MakeExample deriving Show
  :i Example
  data Example = MakeExample      -- Defined at <interactive>:30:1
  instance [safe] Show Example    -- Defined at <interactive>:30:37
```

## 11.9 newtype

- However, one key contrast between a newtype and a type
  alias is that you can define typeclass instances for newtypes that
  differ from the instances for their underlying type.

- code:

```haskell
  newtype Goats = Goats Int
  newtype Cows  = Cows  Int

  class TooMany a where
    tooMany :: a -> Bool
  
  instance TooMany Goats where
    tooMany (Goats n) = n > 42
  instance TooMany Cows where
    tooMany (Cows n) = n > 131
  ```

- On the other hand, what about the case where we want to
  reuse the typeclass instances of the type our newtype contains?
  For common typeclasses built into GHC like Eq, Ord, Enum, and
  Show we get this facility for free, as you’ve seen with the deriving
  clauses in most datatypes.
  For user-defined typeclasses, we can use a language exten-
  sion called GeneralizedNewtypeDeriving. Language extensions,
  enabled in GHC by the LANGUAGE pragma

- {-# LANGUAGE GeneralizedNewtypeDeriving #-}

- This is also nice for times when we want every typeclass
  instance to be the same *except* for the one we want to change.

- FlexibleInstances
