document.addEventListener("DOMContentLoaded", function(){  
  const btnNewGroupModal = document.querySelector(".new_group_modal_btn");
  const newGroupModal = document.querySelector(".new_group_modal");
  const overlay = document.querySelector(".overlay");
  const btnCloseNewGroupModal = document.querySelector(".close_new_group_modal");

  const openNewGroupModal = function () {
    newGroupModal.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }

  const closeNewGroupModal = function () {
    newGroupModal.classList.add("hidden");
    overlay.classList.add("hidden");
  }

  btnNewGroupModal.addEventListener('click', openNewGroupModal);
  btnCloseNewGroupModal.addEventListener('click', closeNewGroupModal);
  overlay.addEventListener('click', closeNewGroupModal);
})