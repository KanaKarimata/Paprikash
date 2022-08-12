'use strict';

document.addEventListener("DOMContentLoaded", function(){
  //モーダルウインドウ
  const showModal = document.querySelector(".show-modal");
  const modal = document.querySelector(".my_modal");
  const overlay = document.querySelector(".overlay");
  const btnCloseModal = document.querySelector(`.close_my_modal`);
　//モーダルを開く
  const openModal = function () {
    modal.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }
  //モーダルを閉じる
  const closeModal = function() {
    modal.classList.add("hidden");
    overlay.classList.add("hidden");
  }
  showModal.addEventListener('click', openModal);
  btnCloseModal.addEventListener('click', closeModal);
  overlay.addEventListener('click', closeModal);
})
