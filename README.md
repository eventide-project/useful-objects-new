# The Doctrine of Useful Objects

An object is the part of the code that does the doing. It has behavior, and it has the data its behavior operates on.

Such an object is useful when it can be used the moment it is initialized — when no dependency is left uninitialized, and no use of one raises a nil reference error. Its dependencies default to safe, inert implementations of their interfaces. Its class interface constructs the operational ones.
