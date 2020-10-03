# Syntax

### Return Synax, implicit followed by explicit. Note the brackets

```
const myfunc = () => (
  returnVal;
);
```

```
const myfunc = () -> {
  return returnVal;
};
```

### Function Calls vs Function References

`myfunc()` {Function call}
`myfunc` {Function reference}


# Concepts

### Callbacks

Often, code may be asyncronous, i.e. not execute immeadiately when it is called. An example may be a function that returns only after 10 seconds, it is called but the  result is not returned until later, and the program will not stop *just* for it. A callback is a function that is supplied to an asyncronous function as a paramater,   with callback being called once the asyncrounous function has finished.

### Promises

A *promise* is a special JavaScript object that links 'producing code' to 'comsuming code', e.g. a function and function call. The 'producing code' takes whatever time it needs to produce the promised result, and the promise makes that result available to all the consumers when it's ready.

The consuming code can be denoted with `.then(...)`, executing only after the promise has been fulfilled. Errors can be caught with `.catch(...)`

By putting the `async` keyword in front of a function declaration means that the function wil always return a promise. Other values are wrapped in a resolved promise
automatically. The keyword `await` can only be used within `async` fucntion, and makes JavaScript wait until the promise is settled and returns its result. `await`     literally suspends the function execution until the promise is settled.

# Types

### Type Intersection and Union

* Type intersection *combines* types, so that all properties and members of both types are available. Denoted by `&`
* Type Union are an either/or scenario. Instead of combining types to receive all properties and members, union types are used to specify that a method accepts either
  of several types. An example would be `padLeft(value: string, padding: string | number)`, where union is given by `|`
* Optional properties of a type can be denoted with `?`. An example would be `type TextBox { name?: string, desription: string }`

# Tips n Tricks


 
