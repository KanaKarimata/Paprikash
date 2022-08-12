'use strict';

document.addEventListener("DOMContentLoaded", function(){
  const btnEditGroupModal = document.querySelector(".group_edit_btn");
  const editGroupModal = document.querySelector(".edit_group_modal");
  const overlay = document.querySelector(".overlay");
  const btnCloseEditGroupModal = document.querySelector(".close_edit_group_modal");

  const openEditGroupModal = function () {
    editGroupModal.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }

  const closeEditGroupModal = function () {
    editGroupModal.classList.add("hidden");
    overlay.classList.add("hidden");
  }

  btnEditGroupModal.addEventListener('click', openEditGroupModal);
  btnCloseEditGroupModal.addEventListener('click', closeEditGroupModal);
  overlay.addEventListener('click', closeEditGroupModal);
})
