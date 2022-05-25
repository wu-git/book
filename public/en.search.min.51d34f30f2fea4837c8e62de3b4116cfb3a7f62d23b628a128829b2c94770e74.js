'use strict';(function(){const searchDataURL='/en.search-data.min.ae0dc594f2ebc2fdb23446aa3daf8d8bff74faf04d92ca2d8260c3c7913c3808.json';const indexConfig=Object.assign({cache:true},{doc:{id:'id',field:['title','content'],store:['title','href','section']}});const input=document.querySelector('#book-search-input');const results=document.querySelector('#book-search-results');if(!input){return}
input.addEventListener('focus',init);input.addEventListener('keyup',search);document.addEventListener('keypress',focusSearchFieldOnKeyPress);function focusSearchFieldOnKeyPress(event){if(event.target.value!==undefined){return;}
if(input===document.activeElement){return;}
const characterPressed=String.fromCharCode(event.charCode);if(!isHotkey(characterPressed)){return;}
input.focus();event.preventDefault();}
function isHotkey(character){const dataHotkeys=input.getAttribute('data-hotkeys')||'';return dataHotkeys.indexOf(character)>=0;}
function init(){input.removeEventListener('focus',init);input.required=true;fetch(searchDataURL).then(pages=>pages.json()).then(pages=>{window.bookSearchIndex=FlexSearch.create('balance',indexConfig);window.bookSearchIndex.add(pages);}).then(()=>input.required=false).then(search);}
function search(){while(results.firstChild){results.removeChild(results.firstChild);}
if(!input.value){return;}
const searchHits=window.bookSearchIndex.search(input.value,10);searchHits.forEach(function(page){const li=element('<li><a href></a><small></small></li>');const a=li.querySelector('a'),small=li.querySelector('small');a.href=page.href;a.textContent=page.title;small.textContent=page.section;results.appendChild(li);});}
function element(content){const div=document.createElement('div');div.innerHTML=content;return div.firstChild;}})();