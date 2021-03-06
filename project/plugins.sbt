scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature")

addSbtPlugin("org.xerial.sbt"   % "sbt-sonatype"    % "3.9.5")
addSbtPlugin("com.jsuereth"     % "sbt-pgp"         % "2.1.1")
addSbtPlugin("org.scalariform"  % "sbt-scalariform" % "1.8.3")
addSbtPlugin("ch.epfl.lamp"     % "sbt-dotty"       % "0.5.1")
