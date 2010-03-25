package ru.circumflex.md

import java.util.regex._

/* # The Markdown Processor */

/**
 * This utility converts a plain text written in [Markdown][1] into HTML fragment.
 * The `apply(String)` method does all the work.
 *
 *  [1]: http://daringfireball.net/projects/markdown/syntax "Markdown Syntax"
 */
object Markdown {

  /* # Regex patterns */

  // standardize line endings
  private val rLineEnds = Pattern.compile("\\r\\n|\\r")
  // strip out whitespaces in blank lines
  private val rBlankLines = Pattern.compile("^ +$", Pattern.MULTILINE)
  // replace tabs with spaces
  private val rTabs = Pattern.compile("\\t")

  /* # The Processing Stuff */

  // Normalization includes following stuff:
  //
  // * replace DOS- and Mac-specific line endings with `\n`;
  // * replace tabs with spaces;
  // * reduce all blank lines (i.e. lines containing only spaces) to empty strings.

  /**
   * Converts the `source` from Markdown to HTML.
   */
  def apply(source: String): String = {
    val text = new StringEx(source)
        .replaceAll(rLineEnds, "\n")
        .replaceAll(rTabs, "    ")
        .replaceAll(rBlankLines, "")

    return text.toString
  }

}

/* # Utility stuff */

/**
 * Wraps the source into mutable StringBuilder with utility methods.
 */
class StringEx(source: CharSequence) {
  private var text = new StringBuffer(source)

  /**
   * A convenient equivalent to `String.replaceAll` that accepts `Pattern`,
   * which is often compiled with `Pattern.MULTILINE`.
   */
  def replaceAll(pattern: Pattern, replacement: String): this.type = {
    val lastIndex = 0;
    val m = pattern.matcher(text);
    val sb = new StringBuffer();
    while (m.find()) m.appendReplacement(sb, replacement);
    m.appendTail(sb);
    text = sb;
    return this;
  }

  /**
   * Appends the specified character sequence.
   */
  def append(s: CharSequence): this.type = {
    text.append(s)
    return this
  }

  /**
   * Prepends the specified character sequence.
   */
  def prepend(s: CharSequence): this.type = {
    val sb = new StringBuffer(s).append(text)
    text = sb
    return this
  }

  /**
   * Emits the wrapped content.
   */
  override def toString = text.toString
}
