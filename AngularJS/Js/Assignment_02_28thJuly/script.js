
var Students = [
    {
      "FirstName": "John",
      "LastName": "Doe",
      "Age": 20,
      "Department": "Computer Science"
    },
    {
      "FirstName": "Jane",
      "LastName": "Smith",
      "Age": 22,
      "Department": "Physics"
    },
    {
      "FirstName": "Michael",
      "LastName": "Johnson",
      "Age": 21, 
      "Department": "Mathematics"
    },
    {
      "FirstName": "Sarah",
      "LastName": "Williams",
      "Age": 19,
      "Department": "Computer Science"
    },
    {
      "FirstName": "Robert",
      "LastName": "Brown",
      "Age": 23,
      "Department": "Mathematics"
    },
    {
      "FirstName": "Emily",
      "LastName": "Davis",
      "Age": 20,
      "Department": "Computer Science"
    }
  ];







var ResultButton = document.getElementById("ResultButton");

    // Add a click event listener to the button
    ResultButton.addEventListener("click", function () {
        //Using an anonymous function and triggering it by id
      //List the students whose department is computer science.
      var studentInCs = Students.filter(x=>x.Department=="Computer Science");
      console.log(studentInCs);


      //List the first name of students whose age is greater than  21
      var ageGreaterThan21 = Students.filter(x=>x.Age>21).map(x=>x.FirstName);
      console.log(ageGreaterThan21);


      //Check whether a student having a first name as Robert is present in the Computer Science Department. The result should be in boolean type
      var isRobertAndCsDept = Students.some(x=>x.FirstName=="Robert"&& x.Department=="Computer Science");
      console.log(isRobertAndCsDept);


      // Check whether there is any student whose age is greater than 23 is studying in the Maths department.The result should be in boolean type
      var isAgeGreaterThan23AndMathsDept = Students.some(x=>x.Age>23 && x.Department=="Mathematics");
      console.log(isAgeGreaterThan23AndMathsDept);


      // Check whether all the students are above an age group of 18.The result should be in boolean type.
      var isAgeAbove18 = Students.every(x=>x.Age>18);
      console.log(isAgeAbove18);


       // Assuming that there is only one student having a first name as John, Print his department name.
      var johnDept = Students.find(x=>x.FirstName=="John").Department;
      console.log(johnDept);
    });




