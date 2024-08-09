const navbar = document.querySelector("#navbar")
const nav = document.getElementById('navbar')

const divs = document.querySelectorAll('div')

// console.log(navbar)
// console.log(nav)
// console.log(divs)

// console.log('=====RECAP END=====')

const students = ['Hermione', 'Neville', 'Ron', 'Draco']

liContent = ''
students.forEach((student) => {
  listItem = `<li>${student}</li>`
  liContent += listItem
})
// console.log('=====Generate List w/ Javascript=====')
// console.log(liContent)
// console.log('=====Generate List w/ Javascript END=====')

const unorderedList = `<ul class='hogwarts'>${liContent}</ul>`

// <ul>
//   <li>hermione 🧙</li>
//   <li>Neville 🧙</li>
// </ul>

const container = document.querySelector('.container')
container.insertAdjacentHTML('beforeend', unorderedList)

const listItems = document.querySelectorAll('ul.hogwarts li')
// console.log(listItems)

listItems.forEach((item) => {
  // console.log(item)
  item.innerText += ' 🧙'
})


const agnetha = document.querySelector('#agnetha')
console.log(agnetha.dataset.instrument)
console.log(agnetha.dataset.band)


const abbaMembers = document.querySelectorAll('li.abba')
// console.log(abbaMembers)
abbaMembers.forEach((member) => {
  member.innerText += member.dataset.instrument
})



// const image = document.querySelector('#jasmim')
// console.log(image)

// image.addEventListener('click', (event) => {
//   console.log(event)
//   console.log(event.currentTarget)
//    // reference the element that FIRED the event we should use .currentTarget
//   // we want to add the img-circle class
//    event.currentTarget.classList.toggle('img-circle')
// })


// 1. SELECT THE RIGHT ELEMENTS
const images = document.querySelectorAll('img.student')
// console.log(images)
images.forEach((img) => {
  // 2. Add an event listener to each one of those images
  img.addEventListener('click', (event) => {
    // 3. for each image, we should add the img circle class when the user clicks
    event.currentTarget.classList.toggle('img-circle')
  })

})


// PREVETING DEFAULT BEHAVIOR
const link = document.querySelector('#link')
link.addEventListener('click', (event) => {
  event.preventDefault();
  console.log(event)
})


// Questions I ask when thinking about JS features ⤵️
// 1. What element the user will interact with?
// We probably will need to add an event listenerto this element
// This means that we need to select this element
// 2. Which element we will need to manipulate WHEN the event happens

const selectAll = document.querySelector('#select-all-checkbox')
const checkboxes = document.querySelectorAll('.form-check-input')

selectAll.addEventListener('change', (event) => {
  console.log(event.currentTarget.checked)
  checkboxes.forEach((checkbox) => {
    // if (event.currentTarget.checked) {
    //   checkbox.checked = true
    // } else {
    //   checkbox.checked = false
    // }
    checkbox.checked = event.currentTarget.checked
  })
})
