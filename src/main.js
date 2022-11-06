import 'jquery';
import 'jquery-smooth-scroll';
import 'lity';
import "bootstrap"
import "./js/so-simple/main"
import hljs from "highlight.js/lib/core"
import php from "highlight.js/lib/languages/php"

hljs.registerLanguage('php', php);

document.querySelectorAll('div.highlighter-rouge').forEach(el => {
	// then highlight each
	// hljs.highlightElement(el);
});