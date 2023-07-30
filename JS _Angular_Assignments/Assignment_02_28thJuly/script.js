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
    function showResults(){
        //List the students whose department is computer science.
    var studentInCs = Students.filter(y=>y.Department=="Computer Science");
    console.log(studentInCs);
        //List the first name of students whose age is greater than  21
    var ageGreaterThan21 = Students.filter(x=>x.Age>21).map(x=>x.FirstName);
    console.log(ageGreaterThan21);
        //Check whether a student having a first name as Robert is present in the Computer Science Department. The result should be in boolean type
    var isRobertAndCsDept = Students.some(y=>y.FirstName=="Robert"&& y.Department=="Computer Science");
    console.log(isRobertAndCsDept);
        // Check whether there is any student whose age is greater than 23 is studying in the Maths department.The result should be in boolean type
    var isAgeGreaterThan23AndMathsDept = Students.some(y=>y.Age>23 && y.Department=="Mathematics");
    console.log(isAgeGreaterThan23AndMathsDept);
        // Check whether all the students are above an age group of 18.The result should be in boolean type.
    var isAgeAbove18 = Students.every(y=>y.Age>18);
    console.log(isAgeAbove18);   
        // Assuming that there is only one student having a first name as John, Print his department name.
    var johnDept = Students.find(y=>y.FirstName=="John").Department;   
    console.log(johnDept);
    }