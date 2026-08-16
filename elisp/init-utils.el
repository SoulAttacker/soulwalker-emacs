;;; init-utils.el --- utils config                   -*- lexical-binding: t; -*-

;; Copyright (C) 2025  soulwalker

;; Author: soulwalker
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;; open configuration project
(defun open-soulwalker-configuration ()
  "Open soulwalker configuration file"
  (interactive)
  (cond
   ((eq soulwalker-completion-mechanism 'ivy)
    (counsel-find-file user-emacs-directory))
   ((eq soulwalker-completion-mechanism 'vertico)
    (ido-find-file-in-dir user-emacs-directory))))

(defvar soulwalker/original-python-path nil)
(defvar soulwalker/original-exec-path nil)

(defun soulwalker/uv-deactivate ()
  "Deactivate current Python virtual environment."
  (interactive)

  (when soulwalker/original-python-path
    (setenv "PATH" soulwalker/original-python-path))

  (when soulwalker/original-exec-path
    (setq exec-path soulwalker/original-exec-path))

  (setq soulwalker/original-python-path nil)
  (setq soulwalker/original-exec-path nil)

  (setenv "VIRTUAL_ENV" nil)
  (setenv "PYTHONHOME" nil)

  (setq python-shell-interpreter "python")

  (message "Python virtual environment deactivated"))

;; (defun soulwalker/uv-activate ()
;;   "Activate nearest .venv Python environment from current directory upward."
;;   (interactive)
;;   (let* ((start-dir default-directory)
;;          (venv-root (locate-dominating-file start-dir ".venv")))
;;     (if (not venv-root)
;;         (error "No .venv found upward from %s" start-dir)
;;       (let* ((venv-path (expand-file-name ".venv" venv-root))
;;              (python-path (expand-file-name
;;                            (if (eq system-type 'windows-nt)
;;                                "Scripts/python.exe"
;;                              "bin/python")
;;                            venv-path)))
;;         (if (file-exists-p python-path)
;;             (progn
;;               (setq python-shell-interpreter python-path)

;;               (let ((venv-bin-dir (file-name-directory python-path)))
;;                 (setq exec-path
;;                       (cons venv-bin-dir
;;                             (remove venv-bin-dir exec-path))))

;;               (setenv "PATH"
;;                       (concat (file-name-directory python-path)
;;                               path-separator
;;                               (getenv "PATH")))

;;               (setenv "VIRTUAL_ENV" venv-path)
;;               (setenv "PYTHONHOME" nil)

;;               (message "Activated UV Python environment at %s" venv-path))
;;           (error "No python executable found in %s" venv-path))))))


(defun soulwalker/uv-activate ()
  "Activate nearest .venv Python environment from current directory upward."
  (interactive)

  ;; If a virtual environment is already active, deactivate it first.
  (when (getenv "VIRTUAL_ENV")
    (soulwalker/uv-deactivate))

  (let* ((start-dir default-directory)
         (venv-root (locate-dominating-file start-dir ".venv")))

    (if (not venv-root)
        (error "No .venv found upward from %s" start-dir)

      (let* ((venv-path (expand-file-name ".venv" venv-root))
             (python-path
              (expand-file-name
               (if (eq system-type 'windows-nt)
                   "Scripts/python.exe"
                 "bin/python")
               venv-path))
             (venv-bin-dir
              (file-name-directory python-path)))

        (if (not (file-exists-p python-path))
            (error "No python executable found in %s" venv-path)

          ;; Save the original environment before modifying it.
          (setq soulwalker/original-python-path
                (getenv "PATH"))

          (setq soulwalker/original-exec-path
                (copy-sequence exec-path))

          ;; Python interpreter used by python.el.
          (setq python-shell-interpreter python-path)

          ;; Put .venv/bin at the front of exec-path.
          (setq exec-path
                (cons venv-bin-dir
                      (remove venv-bin-dir exec-path)))

          ;; Put .venv/bin at the front of PATH.
          (setenv "PATH"
                  (concat venv-bin-dir
                          path-separator
                          (getenv "PATH")))

          ;; Set virtual environment variables.
          (setenv "VIRTUAL_ENV" venv-path)
          (setenv "PYTHONHOME" nil)

          (message "Activated UV Python environment at %s"
                   venv-path))))))


(defun soulwalker/uv-current-environment ()
  "Display the currently active Python environment."
  (interactive)

  (if-let ((venv (getenv "VIRTUAL_ENV")))
      (message "Current Python environment: %s" venv)
    (message "No Python virtual environment is active.")))

(defun is-hyprland ()
  "Check if Emacs is running under the Hyprland Wayland compositor."
  (let ((desktop-env (getenv "XDG_CURRENT_DESKTOP"))
        (hyprland-sig (getenv "HYPRLAND_INSTANCE_SIGNATURE")))

    ;; Check for the Hyprland instance signature (most reliable check)
    (if hyprland-sig
        t
      ;; Otherwise, check the desktop environment variable
      (and (stringp desktop-env) ;; Ensure desktop-env is a string before matching
           (string-match-p "hyprland" desktop-env)))))


(provide 'init-utils)
;;; init-utils.el ends here
