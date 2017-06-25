@echo off
 
:: Create the basic SBT project structure.
:: Does not overwrite existing project folder.
:: Use the command `rd /s /q {folder-name}` for removing existing folder.
 
:: version 0.1
:: author: David Landa
:: license: http://creativecommons.org/licenses/by-sa/2.5/
 
set /p project=Enter the project name: 
 
:: Create the projetc directory structure.
md "%project%\src\main\java" ^
   "%project%\src\main\scala"^
   "%project%\src\main\resources" || goto :error
 
md "%project%\src\test\java"^
   "%project%\src\test\scala"^
   "%project%\src\test\resources" || goto :error
 
:: Create the `build.sbt` file in the root folder
:: + add the scala-test dependency.
echo name:= "%project%">> %project%/build.sbt
echo.>>%project%/build.sbt
 
echo version:= "0.0.1">> %project%/build.sbt
echo.>>%project%/build.sbt
 
echo scalaVersion:= "2.12.1">> %project%/build.sbt
echo.>>%project%/build.sbt
 
:: FIXME echo libraryDependencies += "org.scalatest" %% "scalatest" %% "3.0.0" %% "test">> %project%\build.sbt
 
:: Create the `.scala` files.
echo object HelloWorld {  def main(args: Array[String]): Unit = { println("Hello, world!") }}>> "%project%\src\main\scala\Hello.scala"
 
goto success
 
:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%
 
:success
echo Project with name `%project%' created.
echo Happy coding!