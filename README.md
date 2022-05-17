# League Backend Challenge

This application provides a solution for the above challenge. The output can be viewed via the browser by starting the server and visiting the following urls:

1. localhost:8080/echo?file=<file_path>
2. localhost:8080/invert?file=<file_path>
3. localhost:8080/flatten?file=<file_path>
4. localhost:8080/sum?file=<file_path>
5. localhost:8080/multiply?file=<file_path>

The <file_path> specifies the path to the csv file. For instance, ./test/matrix.csv

A valid path will look like this: localhost:8080/echo?file=./test/matrix.csv

## Running the Application

Note: Make sure you have Ruby and Bundler installed before running the application.

```
1. Clone or download the application folder
2. Navigate to the root directory of the application in a terminal
3. run bundle install
4. run ruby server.rb to start the server
5. Open your browser and enter any of the above urls
6. The result is displayed in the browser based on the solution output as outlined below.
```

## Solution output

The input file to these functions is a matrix, of any dimension where the number of rows are equal to the number of columns (square). Each value is an integer, and there is no header row.

Given a csv file which contains.

```
1,2,3
4,5,6
7,8,9
```

1. Echo

   - Returns the matrix as a string in matrix format.

   ```
   1,2,3
   4,5,6
   7,8,9
   ```

2. Invert
   - Returns the matrix as a string in matrix format where the columns and rows are inverted
   ```
   1,4,7
   2,5,8
   3,6,9
   ```
3. Flatten
   - Returns the matrix as a 1 line string, with values separated by commas.
   ```
   1,2,3,4,5,6,7,8,9
   ```
4. Sum
   - Returns the sum of the integers in the matrix
   ```
   45
   ```
5. Multiply
   - Returns the product of the integers in the matrix
   ```
   362880
   ```
