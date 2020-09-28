// 拡張機能でdart言語は気軽に試せる

// classに属さない関数定義が可能
// 戻り値は省略可能で省略した場合，void
// 型推論

void try1() {
  // String型はシングルでもダブルクォーテーションでも可
  print('try1');
  // varは型推論してくれる
  var i = 0;
  print('i = ' + i.toString());
  int j = 1;
  print('j = ' + j.toString());
}

// listとか
void try2() {
  print('try2');
  final List<int> list = [1, 2, 3];
  // generic型
  final List<dynamic> list2 = ['a', 1, 2];
  // const はコンパイル定数となる
  const i = 3;
  print(list);
  print(list2);
  print(i);
}

// unicode
void try3() {
  print('try3');
  Runes runes = Runes('😊😊😊😊😊');
  print(runes);
  // unicode出力
  print(String.fromCharCodes(runes));
}

// 引数
// デフォルトパラメータを設定可能
void try4(int a, {int b, int c = 100}) {
  print('try4');
  print(a);
  print(b);
  print(c);
}

// null pointer exception回避
void try5(int x) {
  print('try5');
  var z = x?.toString();
  print('z = ');
  print(z);
}

// Collection for
void try6() {
  print('try6');
  var list = [
    -1,
    0,
    for (var i in [1, 2, 3]) i
  ];

  for (var x in list) {
    print(x);
  }
}

/**
 * 匿名関数 引数に関数を渡すときなど
 * (int a) {return 3;}
 */

/**
 * 抽象クラス
 */
abstract class A {
  void showname();
}

/**
 * 普通のクラス
 */
class AA {
  // メンバ変数．private とかはないのでアクセスできる
  var _hoge;
  AA(this._hoge);
  void show() {
    print('_hoge = ' + this._hoge);
  }
}

/**
 * Implements
 * すべてのメンバ変数のgetter, setter, 関数をoverrideする必要があるらしい
 */
class BB implements AA {
  @override
  void set _hoge(__hoge) {
    this._hoge = _hoge;
  }

  @override
  void show() {
    print('show bb hoge = ' + this._hoge);
  }

  @override
  get _hoge => _hoge;
}

// extends
class CC extends AA {
  // コンストラクタ
  CC(hoge) : super(hoge);
}

/**
 * コンストラクタなしのclass
 * mixinと書くことでmixinでしか使えない
 */
mixin Noconstructor1 {
  String greet() => 'hello';
  String greet2() => 'hello2';
}

// with以降のクラスの関数を再利用できる
class D extends AA with Noconstructor1 {
  D(hoge) : super(hoge);
}

// 関数型に名前を付ける
// aとbを比較してboolを返す関数の名前を`Equiv`とする
// 引数で `Equiv e` みたいに使用可能
typedef Equiv = bool Function(int a, int b);
/**
 * メイン関数が必要
 */
void main() {
  try1();
  try2();
  try3();
  // 名前付き引数は省略できる
  try4(3, b: 2);
  try5(null);
  try6();

  AA aa = AA('aaa');
  aa.show();
}
