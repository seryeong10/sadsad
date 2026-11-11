const {test} = require('node:test');
const assert = require('node:assert/strict');
const handler = require('../api/recommend/closet.js');
const items = [
  {id:'top1', category:'상의', name:'셔츠'}, {id:'top2', category:'상의', name:'니트'},
  {id:'bottom1', category:'하의', name:'팬츠'}, {id:'outer1', category:'아우터', name:'재킷'},
];
test('requires real closet tops and bottoms', () => {
  assert.throws(() => handler.parseRequest({items:[]}));
  assert.throws(() => handler.parseRequest({items:[items[0]]}));
  assert.deepEqual(handler.parseRequest({items}).closet_items.map(i=>i.id), items.map(i=>i.id));
});
test('rejects invented ids, duplicate categories, incomplete and duplicate looks', () => {
  const looks = handler.sanitizeOutfits({outfits:[
    {item_ids:['invented','top1','top2','bottom1','outer1'],title:'첫 코디'},
    {item_ids:['bottom1','outer1','top1']}, {item_ids:['top1']},
    {item_ids:['top2','bottom1']},
  ]},items);
  assert.equal(looks.length,2);
  assert.deepEqual(looks[0].item_ids,['top1','bottom1','outer1']);
  assert.deepEqual(looks[1].item_ids,['top2','bottom1']);
});
test('returns actual AI response and does not substitute a mock on failure', async () => {
  const previousFetch=global.fetch, previousKey=process.env.OPENAI_API_KEY;
  const response=()=>({setHeader(){},status(code){this.code=code;return this;},json(body){this.body=body;return this;}});
  process.env.OPENAI_API_KEY='test-only-key';
  try {
    global.fetch=async (url, request)=>{
      assert.equal(url,'https://api.openai.com/v1/chat/completions');
      assert.equal(JSON.parse(request.body).messages.length,2);
      return {ok:true,json:async()=>({choices:[{message:{content:JSON.stringify({outfits:[{item_ids:['top1','bottom1']}]})}}]})};
    };
    const success=response(); await handler({method:'POST',body:{items}},success);
    assert.equal(success.code,200); assert.equal(success.body.source,'openai');
    global.fetch=async()=>({ok:false,status:429});
    const failure=response(); await handler({method:'POST',body:{items}},failure);
    assert.equal(failure.code,503); assert.equal(failure.body.outfits,undefined);
  } finally {
    global.fetch=previousFetch;
    if(previousKey===undefined)delete process.env.OPENAI_API_KEY;else process.env.OPENAI_API_KEY=previousKey;
  }
});
