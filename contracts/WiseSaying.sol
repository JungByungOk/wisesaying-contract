// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract WiseSaying is ERC721, ERC721Enumerable, ERC721Burnable, Ownable {    
    using Strings for uint256; // uint256 to String

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Wise Saying Card", "WSC") {}

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    //----------------------------------------------------- 이하 추가 구현 부분
    
    // 카드 정보 데이터 구조
    struct CardDatas
    { 
        string grade; 
        string wisesaying; 
        string wisesayingman;
    }
    
    // 사용자 등급
    string[] private _grades = 
    [ 
        "WELCOME", 
        "GREEN", 
        "GOLD"
    ];

    // 명언 목록
    string[] private _wisesayings = [
        "Justice is truth in action.",
        "The road to success and the road to failure are almost exactly the same.",
        "It is better to fail in originality than to succeed in imitation.",
        "Success is walking from failure to failure with no loss of enthusiasm.",
        "All progress takes place outside the comfort zone.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The way to get started is to quit talking and begin doing.",
        "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.",
        "Success seems to be connected with action. Successful people keep moving.",
        "In order to succeed, we must first believe that we can."
    ];

    // 말한 사람
    string[] private _wisesayingmans = [
        "Benjamin Disraeli",
        "Colin R. Davis",
        "Herman Melville",
        "Winston Churchill",
        "Michael John Bobak",
        "Henry David Thoreau",
        "Walt Disney",
        "Albert Schweitzer",
        "Conrad Hilton",
        "Nikos Kazantzakis"
    ];

    mapping (uint256 => CardDatas) private _tokenCardDatas;

    /**
    ======================================================
    writer: bojung
    
    블록 difficulty를 이용한 난수 생성
    ======================================================
    */
    function random(uint number) public view returns(uint){
        //return block.prevrandao % number;
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % number;
    }

    /**
    ======================================================
    writer: bojung

    랜덤하게 데이터를 설정한다.
    ======================================================
    */
    function setCardData(uint256 tokenId) private
    {
        uint num = random(10);

        _tokenCardDatas[tokenId] = CardDatas(_grades[0], _wisesayings[num], _wisesayingmans[num]);

        console.log("grade is %s", _grades[0]);
    }

    /**
    ======================================================
    writer: bojung

    민팅할때 tokenId 별로 데이터 랜덤 선택해서 저장하고 블록체인 스토리지에 관리한다.
    ======================================================
    */
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);

        // 신규 Token 에 카드 데이터 설정
        setCardData(tokenId);
    }

    /**
    ======================================================
    writer: bojung

    SVG 대신 HTML/CSS형태로 Asset을 생성해 본다.
    * 탬플릿 html에 사용자별로 다른 값을 설정하여 생성한다.
    * TokenId별로 맵핑되는 파라미터는 아래와 같다.
        ㄴ TokenName, TokenSymbol, TokenId, (fix)
        ㄴ Membership Grade, WiseSaying, WiseSayingPerson (random)
    ======================================================
    Browser 테스트
    (html) data:text/html;base64,PHN0eWxlPgogICAgLmNhcmQtc2lkZSB7CiAgICAgICAgaGVpZ2h0OiA0MDBweDsKICAgICAgICBib3JkZXItcmFkaXVzOiAxMHB4OwogICAgICAgIHRyYW5zaXRpb246IDFzOwogICAgICAgIGJhY2tmYWNlLXZpc2liaWxpdHk6IGhpZGRlbjsKICAgICAgICBwb3NpdGlvbjogYWJzb2x1dGU7CiAgICAgICAgdG9wOiAwOwogICAgICAgIGxlZnQ6IDA7CiAgICAgICAgd2lkdGg6IDMwMDsKICAgICAgICBwYWRkaW5nOiAycmVtOwogICAgICAgIG1hcmdpbjogNSU7CiAgICAgICAgY29sb3I6ICNmZmYKICAgIH0KCiAgICAuY2FyZC1zaWRlLmJhY2sgewogICAgICAgIHRyYW5zZm9ybTogcm90YXRlWSgtMTgwZGVnKTsKICAgICAgICBiYWNrZ3JvdW5kLWNvbG9yOiAjNDE1OGQwOwogICAgICAgIGJhY2tncm91bmQtaW1hZ2U6IGxpbmVhci1ncmFkaWVudCg0M2RlZywgIzQxNThkMCAwLCAjYzg1MGMwIDQ2JSwgI2ZmY2M3MCAxMDAlKQogICAgfQoKICAgIC5jYXJkLXNpZGUuZnJvbnQgewogICAgICAgIGJhY2tncm91bmQtY29sb3I6ICMwMDkzZTk7CiAgICAgICAgYmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KDE2MGRlZywgIzAwOTNlOSAwLCAjODBkMGM3IDEwMCUpCiAgICB9CgogICAgLmNhcmQ6aG92ZXIgLmNhcmQtc2lkZS5mcm9udCB7CiAgICAgICAgdHJhbnNmb3JtOiByb3RhdGVZKDE4MGRlZykKICAgIH0KCiAgICAuY2FyZDpob3ZlciAuY2FyZC1zaWRlLmJhY2sgewogICAgICAgIHRyYW5zZm9ybTogcm90YXRlWSgwKQogICAgfQoKICAgIC5jZW50ZXIgewogICAgICAgIHRleHQtYWxpZ246IGNlbnRlcgogICAgfQoKICAgIC5jb250YWluZXIgewogICAgICAgIGZvbnQtZmFtaWx5OiBhcmlhbDsKICAgICAgICBmb250LXNpemU6IDIwcHg7CiAgICAgICAgd2lkdGg6IDEwMCU7CiAgICAgICAgaGVpZ2h0OiAxMDAlOwogICAgICAgIHBvc2l0aW9uOiByZWxhdGl2ZQogICAgfQoKICAgIC5jaGlsZCB7CiAgICAgICAgd2lkdGg6IDEwMCU7CiAgICAgICAgcG9zaXRpb246IGFic29sdXRlOwogICAgICAgIHRvcDogNTAlOwogICAgICAgIG1hcmdpbi10b3A6IC0yNXB4CiAgICB9Cjwvc3R5bGU+CjxkaXYgY2xhc3M9ImNhcmQiPgogICAgPGRpdiBjbGFzcz0iY2FyZC1zaWRlIGZyb250Ij4KICAgICAgICA8ZGl2IGNsYXNzPSJjb250YWluZXIiPgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJjaGlsZCI+e0RlYWwgd2l0aCB0aGUgZmF1bHRzIG9mIG90aGVycyBhcyBnZW50bHkgYXMgeW91ciBvd24ufTxwPntDaGluZXNlIFByb3ZlcmJ9PC9wPjwvZGl2PgogICAgICAgIDwvZGl2PgogICAgPC9kaXY+CiAgICA8ZGl2IGNsYXNzPSJjYXJkLXNpZGUgYmFjayI+CiAgICAgICAgPGRpdiBjbGFzcz0iY29udGFpbmVyIj4KICAgICAgICAgICAgPGRpdj5OYW1lOiB7Qk9KVU5HfTwvZGl2PgogICAgICAgICAgICA8ZGl2PlN5bWJvbDoge0pCT308L2Rpdj4KICAgICAgICAgICAgPGRpdj5Ub2tlbklkOiB7MHgwMX08L2Rpdj4KICAgICAgICAgICAgPGRpdj5HcmFkZToge1NpbHZlcn08L2Rpdj4KICAgICAgICA8L2Rpdj4KICAgIDwvZGl2Pgo8L2Rpdj4=
    (svg) data:image/svg+xml;base64,IDxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWluWU1pbiBtZWV0IiB2aWV3Qm94PSIwIDAgMzUwIDM1MCI+CiAgICAgICAgPHN0eWxlPi5iYXNlIHsgZmlsbDogd2hpdGU7IGZvbnQtZmFtaWx5OiBzZXJpZjsgZm9udC1zaXplOiAxNHB4OyB9PC9zdHlsZT4KICAgICAgICA8cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSJibGFjayIgLz4KICAgICAgICA8dGV4dCB4PSI1MCUiIHk9IjQwJSIgY2xhc3M9ImJhc2UiIGRvbWluYW50LWJhc2VsaW5lPSJtaWRkbGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPldhcnJpb3I8L3RleHQ+CiAgICAgICAgPHRleHQgeD0iNTAlIiB5PSI1MCUiIGNsYXNzPSJiYXNlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5MZXZlbHM6IGdldExldmVscyh0b2tlbklkKTwvdGV4dD4KICAgICAgICA8L3N2Zz4=
    */
    function generateAsset(uint256 tokenId) public view returns (string memory) {
        CardDatas memory _cardDatas = _tokenCardDatas[tokenId];

        // bytes memory svg = abi.encodePacked(
        //     '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
        //     '<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>',
        //     '<rect width="100%" height="100%" fill="black" />',
        //     '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">',"Warrior",'</text>',
        //     '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">', "Levels: ",getLevels(tokenId),'</text>',
        //     '</svg>'
        // );

        /*
        ======================================================
        writer: bojung

        solidity에서 urlencoding이 가능하지 않은 것으로 보인다.
        html에 한글이 포함될 경우 유니코드 때문에 urlencoding을 해야 하는데 할수 없다.
        영어로만 구성하고 base64인코딩으로 구현한다.
        ======================================================
        **/
        bytes memory cardHtml = abi.encodePacked(
            '<style> .card-side {height: 400px;border-radius: 10px;transition: 1s;backface-visibility: hidden;position: absolute;top: 0;left: 0;width: 300;padding: 2rem;margin: 2%;color: #fff }.card-side.back {transform: rotateY(-180deg);background-color: #4158d0;background-image: linear-gradient(43deg, #4158d0 0, #c850c0 46%, #ffcc70 100%) }.card-side.front {background-color: #0093e9;background-image: linear-gradient(160deg, #0093e9 0, #80d0c7 100%) }.card:hover .card-side.front {transform: rotateY(180deg) }.card:hover .card-side.back {transform: rotateY(0) }.center {text-align: center }.container {font-family: arial;font-size: 20px;width: 100%;height: 100%;position: relative }.child {width: 100%;position: absolute;top: 50%;margin-top: -25px }</style>',
            '<div class="card">',
            '<div class="card-side front">',
                '<div class="container">',
                    '<div>',"&#128640; Name: ",super.name(),'</div><br>',
                    '<div>',"&#128081; Symbol: ",super.symbol(),'</div><br>',
                    '<div>',"&#128157; TokenId: #",tokenId.toString(),'</div><br>',
                    '<div>',"&#127873; Grade: ",_cardDatas.grade,'</div><br>',
                '</div>',
            '</div>',
            '<div class="card-side back">',
                '<div class="container">',
                    '<div class="child">',_cardDatas.wisesaying,'<p>',_cardDatas.wisesayingman,'</div>',
                '</div>',
            '</div>',
            '</div>'
        );
        
        return string(
            abi.encodePacked(
                "data:text/html;base64,",
                Base64.encode(cardHtml)
            )
        );
    }

    /**
    ======================================================
    writer: bojung

    메타데이터 Json 문자열을 생성하고, 
    온체인에서 생성한 Asset 데이터를 image 속성에 포함하여
    json medatada를 반환한다.
    ======================================================
    */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "Wise Saying Card #', tokenId.toString(), '",',
                '"description": "When the card is flipped, it is an NFT card that can check the saying.",',
                '"image": "', generateAsset(tokenId), '"',
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }    
}
