'use strict';

document.addEventListener("DOMContentLoaded", function(){
  //モーダルウインドウ
  const showNewEventModal = document.querySelector(".new_event_modal_btn");
  const newEventModal = document.querySelector(".new_event_modal");
  const overlay = document.querySelector(".overlay");
  const btnCloseNewEventModal = document.querySelector(".close_new_event_modal");

  　//モーダルを開く
  const openNewEventModal = function () {
    newEventModal.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }
  //モーダルを閉じる
  const closeNewEventModal = function() {
    console.log('clicked');
    newEventModal.classList.add("hidden");
    overlay.classList.add("hidden");
  }

  showNewEventModal.addEventListener('click', openNewEventModal);
  btnCloseNewEventModal.addEventListener('click', closeNewEventModal);

  overlay.addEventListener('click', closeNewEventModal);
})
