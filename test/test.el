;; ;; load-path
;; (let ((default-directory  user-emacs-directory))
;;   (add-to-list 'load-path (expand-file-name "package" default-directory))
;;   (normal-top-level-add-subdirs-to-load-path))
;; 
;; 
;; (require 'lazycat-theme)
;; (lazycat-theme-load-dark)
;; 
;; (require 'awesome-tray)
;; (awesome-tray-mode 1)
;; 
;; 

(require 'cl-lib)

(defun add-subdirs-to-load-path (search-dir)
  (interactive)
  (let* ((dir (file-name-as-directory search-dir)))
    (dolist (subdir
             ;; 过滤出不必要的目录， 提升 Emacs 启动速度
             (cl-remove-if
              #'(lambda (subdir)
                  (or
                   ;; 不是目录的都移除
                   (not (file-directory-p (concat dir subdir)))
                   ;; 目录匹配下面规则的都移除
                   (member subdir '("." ".." ;Linux 当前目录和父目录
                                    "dist" "node_modules" "__pycache__" ;语言相关的模块目录
                                    "RCS" "CVS" "rcs" "cvs" ".git" ".github")))) ;版本控制目录
              (directory-files dir)))
      (let ((subdir-path (concat dir (file-name-as-directory subdir))))
        ;; 目录下有 .el .so .dll 文件的路径才添加到 load-path 中， 提升 Emacs 启动速度
        (when (cl-some #'(lambda (subdir-file)
                           (and (file-regular-p (concat subdir-path subdir-file))
                                ;; .so .dll 文件指非 Elisp 语言编写的 Emacs 动态库
                                (member (file-name-extension subdir-file) '("el" "so" "dll"))))
                       (directory-files subdir-path))
          
          ;; 注意： add-to-list 函数的第三个参数必须为 t ， 表示加到列表末尾
          ;; 这样 Emacs 会从父目录到子目录的顺序搜索 Elisp 插件， 顺序反过来会导致 Emacs 无法正常启动
          (add-to-list 'load-path subdir-path t))

        ;; 继续递归搜索子目录
        (add-subdirs-to-load-path subdir-path)))))

;; (add-subdirs-to-load-path "~/.config/emacs")

(add-to-list 'load-path "~/.config/emacs/package/vertico/extensions/")
(add-to-list 'load-path "~/.config/emacs/package/vertico/")
(require 'vertico)
(vertico-mode 1)
