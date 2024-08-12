/////////
// RECAP
/////////

// 1. Select the right element
// 2. Bind an event listener
// 3. Manipulate as you wish inside the event listener

// const element = document.querySelector('CSS_SELECTOR')
// element.addEventListener('click', (event) => {
  // DO YOUR THING!
// })

//////////////////////////////////////////////

//////////
// FETCH
//////////

// 1. make an http request to the API url
// 2. the server usually responds with a big String, a text
// 2.1 Parse the response
// 3. Use the data from the API

// fetch("https://bored.api.lewagon.com/api/activity") // 1
//   .then(response => response.json())                // 2
//   .then((data) => {                                 // 3
//     console.log(data.activity)
//   })


const insertActivity = (data) => {
  const header = document.querySelector('#activity')
  header.innerText = data.activity
}

const eventCallbackFunction = (event) => {
  event.currentTarget.setAttribute('disabled', '');
  // const activities = ['Do your flashcards', 'join zoom', 'take a break']
  // const randomIndex = Math.floor(Math.random() * 3)
  // const activity = activities[randomIndex]
  // event.currentTarget.innerText = activity
  console.log(event.currentTarget)

  fetch("https://bored.api.lewagon.com/api/activity") // 1
    .then(response => response.json())  // 2
    .then((data) => {
      // console.log(event.target) // ????????
      // console.log(event.currentTarget) // ????????
      // // event.currentTarget.innerText = data.activity
      insertActivity(data);
    })

}

const btn = document.querySelector('.btn.btn-warning');
btn.addEventListener('click', eventCallbackFunction);
