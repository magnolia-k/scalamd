scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature")

addSbtPlugin("org.xerial.sbt"   % "sbt-sonatype"    % "1.0")
addSbtPlugin("com.jsuereth"     % "sbt-pgp"         % "1.0.0")
addSbtPlugin("org.scalariform"  % "sbt-scalariform" % "1.6.0")
