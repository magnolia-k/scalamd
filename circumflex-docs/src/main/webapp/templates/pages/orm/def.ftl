[#ftl]
[#include "/layout.ftl"]
[@page]
[@section id="data-model" title="Chapter 3. Data Definition"]
<p>The data model of an application is usually developed at early phases of
  the software development cycle and can be thought of as a conceptual model
  of a system, which describes various entities involved in that system
  and their relationships.</p>
<p>There are various approaches to data modeling. Data-centric applications
  are usually modeled in a bottom-up fashion: the database schema is designed
  in first place while the classes, metadata, logic and other pieces of
  application are developed later, using database schema as their base.</p>
<p>Circumflex ORM greatly simplifies this design approach: you design
  database model right in your Scala application using
  <a href="#rels">relations</a>, <a href="#rels">records</a>
  and <a href="#aux">auxiliary database objects</a>. They allow
  fine-grained control over resulting DDL (data definition language)
  statements that are used to create real database schema for your
  application. The syntax for object definition closely resembles SQL, so it
  could be read even by those unfamiliar with Scala. These objects
  are subsequently used in your applocation to deal with all data-related
  operations.</p>
<p>The process of creating such constructs is refered to as
  <em>data definition</em>.</p>
<p>It is a common practice to group such objects in a single Scala package
  (it is not required, but usually is conveniant, for example, for generating
  database schema):</p>
<pre>${'package ru.circumflex.sandbox.model'?html}</pre>
<p>Let's take a close look at the essential components of Circumflex ORM.</p>
<h2 id="rels">Relations and records</h2>
<p>In relational theory, a <em>relation</em> is a data structure which
  consists of a heading and an unordered set of tuples (or <em>records</em>)
  which share the same data type.</p>
<p>In Circumflex ORM a <em>relation</em> is an object, whose type is derived
  from the <code>Relation</code> class, while a <em>record</em> is an instance
  of a specific <code>Record</code> subclass.</p>
<p>The usage scenario of the two is trivial: relations are used to store and
  retrieve records. Two subclasses of <code>Relation</code> are particularly
  useful for data definition: <code>Table</code> and <code>View</code>; their
  instances correspond to tables and views of database; they are sometimes
  refered to as <em>physical</em>, because they correspond to actual data
  structures in storage.</p>
<p>Circumflex ORM employs some conventions to avoid boilerplate code
  and introduce some sort of type safety:</p>
<ul>
  <li>both relations and records have a single type parameter, which should
    always point to the actual <code>Record</code> implementation used in your
    application;</li>
  <li>relations should be the companion objects of their corresponding records
    (the constructs share the same name, but <code>class</code> keyword is used
    with records and <code>object</code> keyword is used with relations);</li>
  <li>each record should be uniquely identified within the entire system by it's
    <em>primary key</em> value; the relation should provide a single-column
    primary key constraint (<code>LongIdPk</code> is a handy trait that adds
    <code>id BIGINT NOT NULL PRIMARY KEY</code> column and a sequence to
    generate it's values).</li>
</ul>
<p>The following code fragment summarizes these conventions:</p>
<pre>${'
class User extends Record[User] {   // {1}
  . . .
}

object User extends Table[User]     // {2}
        with LongIdPK[User] {       // {3}
  . . .
}'?html}</pre>
<p>In the example above line #1 shows the declaration of the <code>User</code> class,
  it's instances will be retrieved from and stored to the table <code>User</code>
  shown on line #2. Trait <code>LongIdPK</code> effectively mixes </p>
<h3 id="tabs">Creating tables</h3>
<p>Let's look at </p>
[/@section]
[/@page]