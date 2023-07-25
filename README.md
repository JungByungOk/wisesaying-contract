# wisesaying-contract
hardhat + openzeppline을 이용하고, 메타데이터와 어셋은 온체인상에 존재하는 ERC721 테스트

# sepolia network 
contract address : 0xD4dFF05B21dC713CCd3eabf5A6fF4CB12E0Ce387  
etherscan : https://sepolia.etherscan.io/address/0xD4dFF05B21dC713CCd3eabf5A6fF4CB12E0Ce387  

# metadata
function tokenURI(uint256 tokenId) 호출 결과  

data:application/json;base64,eyJuYW1lIjogIldpc2UgU2F5aW5nIENhcmQgIzAiLCJkZXNjcmlwdGlvbiI6ICJXaGVuIHRoZSBjYXJkIGlzIGZsaXBwZWQsIGl0IGlzIGFuIE5GVCBjYXJkIHRoYXQgY2FuIGNoZWNrIHRoZSBzYXlpbmcuIiwiaW1hZ2UiOiAiZGF0YTp0ZXh0L2h0bWw7YmFzZTY0LFBITjBlV3hsUGlBdVkyRnlaQzF6YVdSbElIdG9aV2xuYUhRNklEUXdNSEI0TzJKdmNtUmxjaTF5WVdScGRYTTZJREV3Y0hnN2RISmhibk5wZEdsdmJqb2dNWE03WW1GamEyWmhZMlV0ZG1semFXSnBiR2wwZVRvZ2FHbGtaR1Z1TzNCdmMybDBhVzl1T2lCaFluTnZiSFYwWlR0MGIzQTZJREE3YkdWbWREb2dNRHQzYVdSMGFEb2dNekF3TzNCaFpHUnBibWM2SURKeVpXMDdiV0Z5WjJsdU9pQXlKVHRqYjJ4dmNqb2dJMlptWmlCOUxtTmhjbVF0YzJsa1pTNWlZV05ySUh0MGNtRnVjMlp2Y20wNklISnZkR0YwWlZrb0xURTRNR1JsWnlrN1ltRmphMmR5YjNWdVpDMWpiMnh2Y2pvZ0l6UXhOVGhrTUR0aVlXTnJaM0p2ZFc1a0xXbHRZV2RsT2lCc2FXNWxZWEl0WjNKaFpHbGxiblFvTkROa1pXY3NJQ00wTVRVNFpEQWdNQ3dnSTJNNE5UQmpNQ0EwTmlVc0lDTm1abU5qTnpBZ01UQXdKU2tnZlM1allYSmtMWE5wWkdVdVpuSnZiblFnZTJKaFkydG5jbTkxYm1RdFkyOXNiM0k2SUNNd01Ea3paVGs3WW1GamEyZHliM1Z1WkMxcGJXRm5aVG9nYkdsdVpXRnlMV2R5WVdScFpXNTBLREUyTUdSbFp5d2dJekF3T1RObE9TQXdMQ0FqT0RCa01HTTNJREV3TUNVcElIMHVZMkZ5WkRwb2IzWmxjaUF1WTJGeVpDMXphV1JsTG1aeWIyNTBJSHQwY21GdWMyWnZjbTA2SUhKdmRHRjBaVmtvTVRnd1pHVm5LU0I5TG1OaGNtUTZhRzkyWlhJZ0xtTmhjbVF0YzJsa1pTNWlZV05ySUh0MGNtRnVjMlp2Y20wNklISnZkR0YwWlZrb01Da2dmUzVqWlc1MFpYSWdlM1JsZUhRdFlXeHBaMjQ2SUdObGJuUmxjaUI5TG1OdmJuUmhhVzVsY2lCN1ptOXVkQzFtWVcxcGJIazZJR0Z5YVdGc08yWnZiblF0YzJsNlpUb2dNakJ3ZUR0M2FXUjBhRG9nTVRBd0pUdG9aV2xuYUhRNklERXdNQ1U3Y0c5emFYUnBiMjQ2SUhKbGJHRjBhWFpsSUgwdVkyaHBiR1FnZTNkcFpIUm9PaUF4TURBbE8zQnZjMmwwYVc5dU9pQmhZbk52YkhWMFpUdDBiM0E2SURVd0pUdHRZWEpuYVc0dGRHOXdPaUF0TWpWd2VDQjlQQzl6ZEhsc1pUNDhaR2wySUdOc1lYTnpQU0pqWVhKa0lqNDhaR2wySUdOc1lYTnpQU0pqWVhKa0xYTnBaR1VnWm5KdmJuUWlQanhrYVhZZ1kyeGhjM005SW1OdmJuUmhhVzVsY2lJK1BHUnBkajRtSXpFeU9EWTBNRHNnVG1GdFpUb2dWMmx6WlNCVFlYbHBibWNnUTJGeVpEd3ZaR2wyUGp4aWNqNDhaR2wyUGlZak1USTRNRGd4T3lCVGVXMWliMnc2SUZkVFF6d3ZaR2wyUGp4aWNqNDhaR2wyUGlZak1USTRNVFUzT3lCVWIydGxia2xrT2lBak1Ed3ZaR2wyUGp4aWNqNDhaR2wyUGlZak1USTNPRGN6T3lCSGNtRmtaVG9nVjBWTVEwOU5SVHd2WkdsMlBqeGljajQ4TDJScGRqNDhMMlJwZGo0OFpHbDJJR05zWVhOelBTSmpZWEprTFhOcFpHVWdZbUZqYXlJK1BHUnBkaUJqYkdGemN6MGlZMjl1ZEdGcGJtVnlJajQ4WkdsMklHTnNZWE56UFNKamFHbHNaQ0krUVd4c0lIQnliMmR5WlhOeklIUmhhMlZ6SUhCc1lXTmxJRzkxZEhOcFpHVWdkR2hsSUdOdmJXWnZjblFnZW05dVpTNDhjRDVOYVdOb1lXVnNJRXB2YUc0Z1FtOWlZV3M4TDJScGRqNDhMMlJwZGo0OEwyUnBkajQ4TDJScGRqND0ifQ==

# metadata decoding
```
{
    "name": "Wise Saying Card #0",
    "description": "When the card is flipped, it is an NFT card that can check the saying.",
    "image": "data:text/html;base64,PHN0eWxlPiAuY2FyZC1zaWRlIHtoZWlnaHQ6IDQwMHB4O2JvcmRlci1yYWRpdXM6IDEwcHg7dHJhbnNpdGlvbjogMXM7YmFja2ZhY2UtdmlzaWJpbGl0eTogaGlkZGVuO3Bvc2l0aW9uOiBhYnNvbHV0ZTt0b3A6IDA7bGVmdDogMDt3aWR0aDogMzAwO3BhZGRpbmc6IDJyZW07bWFyZ2luOiAyJTtjb2xvcjogI2ZmZiB9LmNhcmQtc2lkZS5iYWNrIHt0cmFuc2Zvcm06IHJvdGF0ZVkoLTE4MGRlZyk7YmFja2dyb3VuZC1jb2xvcjogIzQxNThkMDtiYWNrZ3JvdW5kLWltYWdlOiBsaW5lYXItZ3JhZGllbnQoNDNkZWcsICM0MTU4ZDAgMCwgI2M4NTBjMCA0NiUsICNmZmNjNzAgMTAwJSkgfS5jYXJkLXNpZGUuZnJvbnQge2JhY2tncm91bmQtY29sb3I6ICMwMDkzZTk7YmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KDE2MGRlZywgIzAwOTNlOSAwLCAjODBkMGM3IDEwMCUpIH0uY2FyZDpob3ZlciAuY2FyZC1zaWRlLmZyb250IHt0cmFuc2Zvcm06IHJvdGF0ZVkoMTgwZGVnKSB9LmNhcmQ6aG92ZXIgLmNhcmQtc2lkZS5iYWNrIHt0cmFuc2Zvcm06IHJvdGF0ZVkoMCkgfS5jZW50ZXIge3RleHQtYWxpZ246IGNlbnRlciB9LmNvbnRhaW5lciB7Zm9udC1mYW1pbHk6IGFyaWFsO2ZvbnQtc2l6ZTogMjBweDt3aWR0aDogMTAwJTtoZWlnaHQ6IDEwMCU7cG9zaXRpb246IHJlbGF0aXZlIH0uY2hpbGQge3dpZHRoOiAxMDAlO3Bvc2l0aW9uOiBhYnNvbHV0ZTt0b3A6IDUwJTttYXJnaW4tdG9wOiAtMjVweCB9PC9zdHlsZT48ZGl2IGNsYXNzPSJjYXJkIj48ZGl2IGNsYXNzPSJjYXJkLXNpZGUgZnJvbnQiPjxkaXYgY2xhc3M9ImNvbnRhaW5lciI+PGRpdj4mIzEyODY0MDsgTmFtZTogV2lzZSBTYXlpbmcgQ2FyZDwvZGl2Pjxicj48ZGl2PiYjMTI4MDgxOyBTeW1ib2w6IFdTQzwvZGl2Pjxicj48ZGl2PiYjMTI4MTU3OyBUb2tlbklkOiAjMDwvZGl2Pjxicj48ZGl2PiYjMTI3ODczOyBHcmFkZTogV0VMQ09NRTwvZGl2Pjxicj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJjYXJkLXNpZGUgYmFjayI+PGRpdiBjbGFzcz0iY29udGFpbmVyIj48ZGl2IGNsYXNzPSJjaGlsZCI+QWxsIHByb2dyZXNzIHRha2VzIHBsYWNlIG91dHNpZGUgdGhlIGNvbWZvcnQgem9uZS48cD5NaWNoYWVsIEpvaG4gQm9iYWs8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4="
}
```