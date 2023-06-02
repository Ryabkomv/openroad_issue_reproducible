scalaVersion:="2.12.13"
val chiselVersion = "3.5.1"
scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit"
      //"-P:chiselplugin:genBundleElements",
    )
resolvers ++=Seq(
Resolver.sonatypeRepo("snapshots"),
Resolver.sonatypeRepo("releases")
)

resolvers += "Artima Maven Repository" at "https://repo.artima.com/releases"
addCompilerPlugin("edu.berkeley.cs" %% "chisel3-plugin" % chiselVersion cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % chiselVersion
libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.0"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.1"
libraryDependencies += "org.scalactic" %% "scalactic" % "3.2.11"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.11" % "test"
