// // JS NAMING CONVENTIONS // //
// lowerCamelCase | ex: bestTeam

// // How it connects with the HTML file?? // //
// <script></script> in the body of the index.html
// Print stuff to test files connection
// console.log("Hello from JavaScript!");

// // JAVASCRIPT MANIPULATION MANTRA!!!
// STEP 1 is ALWAYS to select the element!!!
// After selecting the element
// you are free to manipulate it as you wish

// // SELECTING ONE ELEMENT // //
// document.querySelector(CSS_SELECTOR);
const players = document.querySelector('#players')
console.log(players)
// const studentList = document.querySelector('#students');
const playersList = document.getElementById('players')
console.log(playersList);



// // DOM MANIPULATIONS // //
// Remeber about the two main steps!!
// 1. select the element
// 2. manipulate as you wish


// Appending content
players.insertAdjacentHTML('beforeend', "<li>Messi</li>")
players.insertAdjacentHTML('afterbegin', '<li>Mbappe</li>')


// // SELECTING MULTIPLE ELEMENTS // //
// document.querySelectorAll(CSS_SELECTOR);
const winners = document.querySelectorAll('#fifa-wins li')
console.log(winners)



// // LIVE-CODE: append FRANCE (2 wins) to the winners ordered list // //
// 1. select the RIGHT element
const orderedList = document.querySelector('#fifa-wins')
console.log(orderedList)
// 2. manipulate
orderedList.insertAdjacentHTML('beforeend', '<li>France (2 wins)</li>')



// // ADVANCED DOM MANIPULATIONS // //

// Show || Hide an element
orderedList.style.display = 'none'
orderedList.style.display = ''
// orderedList.style.backgroundColor = 'red' // commented out because is really ugly
                                      // and the goal was to show you the convention when
                                      // calling properties with more than one word.
                                      // Ex: [CSS] background-color -> [JS] backgroundColor


// Add/Remove a class
const paragraph = document.querySelector('p')
paragraph.classList.add('red')
paragraph.classList.remove('red')
paragraph.classList.toggle('red')


// Read / Write inputs
const emailInput = document.querySelector('#email')
console.log(emailInput.value)
emailInput.value = 'dede@lewagon.org'
console.log(emailInput.value)

// Extract text / HTML
const link = document.querySelector('#home')
console.log(link)
console.log(link.innerText)
console.log(link.innerHTML)
link.innerText = 'Hogwarts School'
link.innerHTML = 'Hogwarts <strong>School</strong>'
console.log(link.innerHTML)
console.log(link.attributes.href.value)

// We can access all attributes from the selected element
// remove the coment for the last line
// and TRY IT 💪
// console.log(link.attributes)
