# Can I learn 'Go' in one night? 

Well, let's see and find out. By learning, I am not deluded enough to master everything, but I will try to cover everything and write here, what I understood. I am essentially following [this book!](https://www.gopl.io/)

I like to run code parallelly while learning, like everybody does, and *Go* provides a way to do this via [Go Playground!](https://play.golang.org/)

Let's begin. 



# let's play around for a while

- Go is a compiled language - inspired from C...Ok

- Contains a toolchain that helps in converting...just like `cargo` for Rust. 

- Code is organized into packages, pretty much the same as other languages' modules or packages etc., `package main` is different as it is an executable and not a lib.

- <span style="color:red;"> You should only use the imports that you are using. Go doesn't tolerate unused imports </span>... Cool. 

-  `func`, `var`, `const` and `type` mean exactly what you might think they mean...

- Go treats `newline` to mean semi-colon while compiling so `{` should be used in the same line as function declaration...Finally some language that adheres to the "correct" usage of function declaration...

- <span style="color:red;"> Go also doesn't permit unused local variables! Neat! That oughta give clean code. </span>

- Let's write some code. Here's a program to print all the command-line arguments 

  ```go
  package main 
  import (
  	"fmt"
  	"os"
  )
  func main(){	
  	s, sep := "", "" 
  	for _, arg := range os.Args[0:] {
  		s += sep + arg 
  		sep = " " 
  	}
  	fmt.Println(s)
  }
  ```

- For variable assigning, follow one of the below two forms

  ```go
  s := "some initial string" // When you care what the initial value is
  var s string  // When you don't 
  ```

  

* Creating a map 

  ```go
  m = make(map[string]int)
  ```

* Read a line and converting it to a string. 

  ```go
  import "bufio"
  
  // Inside function
  input := bufio.NewScanner(os.Stdin)
  input.Scan() // Reads a line
  input.Text() // Converts it to string. 
  ```

* <span style="color:green;">Verbs:</span> The formatting arguments such as `%d` , `%f` etc., are called *verbs* in Go. 

  ```go
  %d : Integer
  %g : Floating point
  %t : Boolean true/false
  %s : string
  %T : type of any value
  ```

* <span style="color:green;"> Composite literals: </span> slices and structs. 

  ```go
  var palette = []color.Color{color.White, color.Black} // slice declaration with a 																														// sequence of items.
  anim := gif.GIF{LoopCount: 2} // struct declaration
  ```

* <span style="color:green"> goroutines: </span> concurrent function execution <span style="color:green"> channel: </span> A communication channel that allows one goroutine to pass values of specific type to another goroutine. 

  ```go
  func fetch(url string, ch chan<- string) {
  	// A goroutine which passes data of type string
    // to the calling goroutine through a `chan` type
    // which means channel. 
  }
  ```

  > go fetch (url, ch) is the way we declare a goroutine. 

* <span style='color:green;'> Loose Ends </span>

  * Switch statement 

  * A switch doesn't need an operand. Can directly write without it. 

    ```go
    switch coinflip() {
         case "heads":
             heads++
         case "tails":
             tails++
         default:
             fmt.Println("landed on edge!")
         }		
    ```

  * Named Types

    ```go
    type Point struct {
             X, Y int
    }
    var p Point	
    ```

  * Pointers

    * Middle ground in the usage of pointers
    * Can address and de-reference using `&` and `*` operators respectively. 
    * NO pointer arithmetic. 

  * Methods and Interfaces

    * Methods are functions for named types.
    * Interfaces are abstract types that let us treat different concrete types in a same manner based on the methods they implement. 

  * Packages

    * Go has an extensive list of packages 

  * Comments

    * Write a comment before declaration of a method to *specify its behaviour* 
    * `//` for single line and `/* ... */` for multi-line comments 



# Program Structure	

let's go into basic structural details of a `Go` program. 

* <span style='color:green'> Names </span>

  * A name begins with a unicode letter or an underscore

  * Entities declared within a function are local to it. 

  * Those declared out can be accessed by other files in the package based on the case of their first letter

    * Lower Case: Accessible to all the files in that package.
    * Upper Case: Visible across packages. Ex: `Printf`

  * Conventionally, Go programmers use variables in *CamelCase*.

    

* <span style='color:green'> Declarations </span>

  * 4 kinds of declarations: `var, const, type, func` 
  * `package` declaration says what package the file is a part of. 

- <span style='color:green'> Variables </span>

  - `var name type = expression` 

  - Either `expression` or `type` can be missing but not both. 

  - If expression is not present then the variable gets the `0` value of its type. 

  - Omitting the types allows declarations of multiple variables of different types.

    - ```go
      var b, f, s = true, 2.3, "four"
      ```

  - A set of variables can also be intialized by assigning them to a function that returns multiple values. 

  - **Short Variable Declaration**

    - To declare and intialize local variables. 
    - `name := expression` 
    - Usually used while declaring local variables.
    - Multiple variables can be declared and used in a single line. 
    - If some variables are already declared short variable decl acts as assignment.

  - **Pointers**

    - It is possible to return a pointer to a local variable from a function. Whaaaa!

  - `new` function 

    - x := new(int)   // creates a variable of type and returns a pointer to its address. 

  - You can use built-in types as variable names but can't use that type for the scope till the variable is valid. 

  - **Lifetime of Variables**

    - 
