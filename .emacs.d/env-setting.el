(cond
 ;; ((eq system-type 'gnu/linux)
 ;;  (setenv "PATH"
 ;;          (concat
 ;;           "/opt/llvm/bin" ":"
 ;;           (getenv "PATH")))
 ;;  (setenv "LD_LIBRARY_PATH"
 ;;          (concat
 ;;           "/opt/llvm/lib" ":"
 ;;           (getenv "LD_LIBRARY_PATH")))
 ;;  )
 ((eq system-type 'windows-nt);; ms windows
  (setenv "PATH"
          (concat
           "D:/Apps/Git/bin" ";"
           "D:/texlive/2016/bin/win32" ";"
           (getenv "PATH")))
  )
)
