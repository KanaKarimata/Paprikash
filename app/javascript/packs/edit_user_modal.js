'use strict';

document.addEventListener("DOMContentLoaded", function(){
  const btnOpenEditModal = document.querySelector(".profile_image");
  const editUserModal = document.querySelector(".edit_user_modal");
  const overlay = document.querySelector(".overlay");
  const btnCloseModal = document.querySelector(".close_my_modal");

  const openEditModal = function () {
    editUserModal.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }

  const closeEditModal = function() {
      editUserModal.classList.add("hidden");
      overlay.classList.add("hidden");
    }

  btnOpenEditModal.addEventListener('click', openEditModal);
  btnCloseModal.addEventListener('click', closeEditModal);
  overlay.addEventListener('click', closeEditModal);
})