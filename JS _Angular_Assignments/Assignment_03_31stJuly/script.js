MovieList = [
  {
    MovieName: "The Great Adventure",
    ActorName: "John Smith",
    ReleaseDate: "2023-01-15",
  },
  {
    MovieName: "Mystery in the Woods",
    ActorName: "Emily Johnson",
    ReleaseDate: "2022-09-28",
  },
  {
    MovieName: "Love and Destiny",
    ActorName: "Michael Brown",
    ReleaseDate: "2023-05-02",
  },
  {
    MovieName: "City of Shadows",
    ActorName: "Sophia Williams",
    ReleaseDate: "2023-03-12",
  },
  {
    MovieName: "The Last Stand",
    ActorName: "William Davis",
    ReleaseDate: "2023-11-07",
  },
  {
    MovieName: "Echoes of Time",
    ActorName: "Olivia Wilson",
    ReleaseDate: "2022-12-19",
  },
];

//Setting up a var to assign the button id to later access the element by its element id
var ResultButton = document.getElementById("ResultButton");
ResultButton.addEventListener("click", function () {
  // 1.List the movie name along with the actor name of those movies released in the year 2022

  // Filter the movies released in the year 2022 and use starts with as the format is YYYY-MM-DD
  const moviesReleasedIn2022 = MovieList.filter((movie) =>
    movie.ReleaseDate.startsWith("2022")
  ).map((movie) => ({
    MovieName2022Filter: movie.MovieName,
    ActorName2022Filter: movie.ActorName,
  }));
  console.log("Answer for First question:");
  console.log(moviesReleasedIn2022);

  //Or without using filter
  var tempArr = [];
  MovieList.forEach((element) => {
    if (element.ReleaseDate.startsWith("2022")) {
      tempArr.push({
        MovieName2022: element.MovieName,
        ActorName2022: element.ActorName,
      });
    }
  });

  console.log(tempArr);

  //2.List the movie names released in the year 2023 where the actor is William Davis.
  const MoviesByWillaimDavisIn2023 = MovieList.filter(
    (movie) =>
      movie.ReleaseDate.startsWith("2022") &&
      movie.ActorName === "William Davis"
  );
  console.log("Answer for Second question:");
  if (Object.keys(MoviesByWillaimDavisIn2023).length != 0) {
    console.log(MoviesByWillaimDavisIn2023);
  } else {
    console.log(" ** No Movies Found. ** ");
  }

  //3.Retrieve the Actor name and release date of the movie “The Last Stand”
  var ActorNameAndReleaseDate = MovieList.filter(
    (x) => x.MovieName === "The Last Stand"
  ).map((movie) => ({
    Actor: movie.ActorName,
    ReleaseDate: movie.ReleaseDate,
  }));

  console.log("The Answer for Third question:");
  console.log(ActorNameAndReleaseDate);

  //4.Check whether there is any movie in the list with actor name “John Doe".
  const MoviesByJohn_Doe = MovieList.filter(
    (movie) => movie.ActorName === "John Doe"
  );
  console.log("Answer for Fourth question:");
  if (Object.keys(MoviesByJohn_Doe).length != 0) {
    console.log(MoviesByJohn_Doe);
  } else {
    console.log(" ** No Movies Found. ** ");
  }
  //Also we can use .some too:
  const MoviesByJohn_DoeS = MovieList.some(
    (movie) => movie.ActorName === "John Doe"
  );
  console.log(MoviesByJohn_DoeS);

  //5.Display the count of movies where the actor name is "Sophia Williams"

  //lets try to use the classic for loop instead of for each,beacause we can learn how to manualy iterate over a JSON obj.
  var count = 0;
  for (let i = 0; i < Object.keys(MovieList).length; i++) {
    if (MovieList[i].ActorName === "Sophia Williams") {
      count++;
    }
  }
  console.log(
    `Answer For Fifth question : The Movie Count by  Sophia Williams is ${count} `
  );

  // 6.Insert an element
  MovieList.push({
    MovieName: "The Final Stage",
    ActorName: "John Doe",
    ReleaseDate: "2022-08-11",
  });
  var axe = Object.keys(MovieList).length;
  console.log(`Answer for Sixth question: ${axe}`);

  //7.Check whether there exists any duplicate movie names present in the array
  var temp = [];
  for (let i = 0; i < Object.keys(MovieList).length; i++) {
    var tempCount = 0;
    for (let j = 0; j < Object.keys(MovieList).length; j++) {
      if (MovieList[i].MovieName === MovieList[j].MovieName) {
        tempCount++;
      }
      var present = temp.includes(MovieList[i]);
      if (tempCount > 1 && !present) {
        temp.push(MovieList[i]);
        break;
      }
    }
  }
  console.log("Answer for Seventh question:");
  if (Object.keys(temp).length != 0) {
    console.log(" << There are some duplicate Movie Name >> ");
    console.log(temp);
  } else {
    console.log(" << No Duplicate Movies >> ");
  }

  //8.Create a new array starting from the movie "City of Shadows"
  var index = MovieList.findIndex((x) => x.MovieName === "City of Shadows");
  const sliced = MovieList.slice(index);
  console.log("Answer for Eighth question:");
  console.log(sliced);

  //9.List the distinct actor names in array

  var DistinctActorName = [];
  MovieList.forEach((actor) => {
    var present = DistinctActorName.includes(actor.ActorName);
    if (!present) {
      DistinctActorName.push(actor.ActorName);
    }
  });
  console.log("Answer for Nineth question:");
  console.log(DistinctActorName);

  //10.Insert Element next to  “Love and Destiny”
  var index = MovieList.findIndex((x) => x.MovieName === "Love and Destiny");
  MovieList.splice(index, 0, {
    MovieName: "Rich & Poor",
    ActorName: "Johnie Walker",
    ReleaseDate: "2023-08-11",
  });
  console.log("Answer for Tenth question:");
  console.log(MovieList);

  //11.Display the count of distinct actor names in array

  var DistinctActor = [];
  MovieList.forEach((actor) => {
    var present = DistinctActor.includes(actor.ActorName);
    if (!present) {
      DistinctActor.push(actor.ActorName);
    }
  });
  console.log("Answer for Eleventh question:");
  console.log(Object.keys(DistinctActor).length);
  console.log(DistinctActor);

  //12.Remove the movie named  "The Last Stand"
  var index3 = MovieList.findIndex((x) => x.MovieName === "The Last Stand");
  MovieList.splice(index3, 1);
  console.log("Answer for Twelth question:");
  console.log(MovieList);
  //13.Check whether all the movies are released after 2021 Dec 31
  var IsReleasedAfter2021Dec31 = MovieList.every(
    (x) => x.ReleaseDate > "2021-12-31"
  );
  console.log("Answer for Thirteenth question:");
  console.log(IsReleasedAfter2021Dec31);

  //14.Update movie named  "City of Shadows" ‘s release date as  "2023-03-13"
  var index4 = MovieList.findIndex((x) => x.MovieName === "City of Shadows");
  MovieList[index4].ReleaseDate = "2023-03-13";
  console.log("Answer for Fourteenth question:");
  console.log(MovieList[index4]);

  //15.Create a new array of movie names whose movie name length is greater than 10
  var MovieLengthGreaterThan10 = [];
  MovieList.forEach((element) => {
    if (element.MovieName.length > 10) {
      MovieLengthGreaterThan10.push(element.MovieName);
    }
  });
  console.log("Answer for Fifteenth question:");
  console.log(MovieLengthGreaterThan10);
});
