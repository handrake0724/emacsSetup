(setenv "PATH"
 (concat
  "/home/seongmo/Desktop/AutoGrid/3rdparty/CGAL-4.7/include" ":"
  "/home/seongmo/Desktop/AutoGrid/3rdparty/eigen3" ":"
  "/opt/llvm/bin" ":"  
  (getenv "PATH")))
(setenv "LD_LIBRARY_PATH"
        (concat
         "/home/seongmo/Desktop/AutoGrid/3rdparty/boost-1.59/lib" ":"
         "/home/seongmo/Desktop/AutoGrid/3rdparty/CGAL-4.7/lib" ":"
         "/opt/llvm/lib" ":"         
         (getenv "LD_LIBRARY_PATH")))

