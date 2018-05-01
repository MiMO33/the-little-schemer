<div class="article-detail">
                    <h2 class="article-tit">
                        第15章　λ演算
                    </h2>
                    <div class="typo typo-selection">
                        <div id="article" class="markdown-body">
<p>在1983年或是1984年，阿隆佐•邱奇大概80岁时，他被邀请到斯坦福大学的语言和信息研究中心做报告，并参观了中心的Xerox Dandelion计算机。计算机运行的是LISP语言，这是由约翰•麦卡锡（1927—2011）发明的一种编程语言。邱奇被告知，LISP是基于他50多年前发明的<em>λ</em>演算发展而来的。</p>

<p>邱奇坦言他对计算机一无所知，但他的一个学生了解计算机。<sup>1</sup>当然，那时所有人都已经知道阿兰•图灵是谁了。</p>

<blockquote>
  <p><sup>1</sup> Maria Manzano，“Alonzo Church: His Life，His Work and Some of His Miracles”，<em>History and Philosophy of Logic</em>，Vol. 18（1997），212。</p>
</blockquote>

<p><em>λ</em>演算是阿隆佐•邱奇在20世纪30年代早期为证明一阶谓词逻辑没有通用判定过程而发明的。图灵在发表关于可计算数和判定性问题的论文之前就对此有所了解了。为此，他在论文中增加了一个附录，用来说明他的方法与邱奇的方法在本质上是等价的，这一附录就是本章的主题。</p>

<p>如果说对<em>λ</em>演算的理念觉得很熟悉，那是因为它们对编程语言的发展影响深远。相当早的时候，人们就发现<em>λ</em>演算与划分为<strong>过程式</strong>或<strong>命令式</strong>的编程语言之间存在着结构关系，例如早期的编程语言ALGOL<sup>2</sup>，基于这个语言发展出了Pascal和C，同样在C基础上发展出了 C++、Java和C#。用过程式语言编写的程序，其结构围绕着将数据传递给过程（也称为子程序或方法）的理念来组织，过程以各种各样的方式对数据进行处理。</p>

<blockquote>
  <p><sup>2</sup> P. J. Landin，“A Correspondence Between ALGOL 60 and Church's Lambda-Notation”，<em>Communications of the ACM</em>，Vol. 8，No.2（Feb 1965），89-101，Vol. 8，No. 3（Mar 1965），158-165。</p>
</blockquote>

<p><em>λ</em>演算对LISP、APL、Haskell、Scheme和F#等<strong>函数式</strong>编程语言有着更直接的影响。在函数式语言中，函数的排列方式更像是链条，后一个函数从前一个函数获得输出。函数式语言通常允许像过程式语言操作数据那样来操作函数。尽管函数式语言没有像过程式语言那样受到主流群体的欢迎，但是最近它们也展露了一些复兴的气息。</p>

<p>阿隆佐•邱奇1903年出生于华盛顿，他职业生涯的大部分时间是在普林斯顿大学度过的。他本科就读于普林斯顿，24岁时获得数学博士学位。在作为国家研究院院士工作两年后，他回到普林斯顿教学，从1929年一直到1967年退休。邱奇后来又在UCLA工作了一段时间，直到1990年。</p>

<p>邱奇是一个勤奋且一丝不苟的人，说话严谨，经常工作到深夜。他的课程经常开始于精心设计的仪式般的擦黑板，有时候还会借助一桶水。在处理数学问题时，他通常会用不同颜色的墨水。当需要更多颜色的时候，他就会按照不同比例混合那些标准颜色的墨水；当完成了一页并要保存起来时，他会用Duco涂满表面。Duco是一种漆，邱奇发现它非常适合保护纸张，因为它不会把纸弄皱。<sup>3</sup></p>

<blockquote>
  <p><sup>3</sup> Herbert B. Enderton，“Alonzo Church: Life and Work”，introduction to <em>Collected Works of Alonzo Church</em>（MIT Press，forthcoming）引言，<a href="http://www.math.ucla.edu/~hbe/church.pdf">http://www.math.ucla.edu/~hbe/church.pdf</a>。</p>
</blockquote>

<p>邱奇指导过31篇博士论文，论文来自于斯蒂芬•克莱尼（1931）、约翰•巴克利•罗瑟（1934）、莱昂•亨金（1947）、马丁•戴维斯（1950）、哈特利•罗杰斯（1952）、雷蒙德•斯穆里安（1959）以及阿兰•图灵（1938）。<sup>4</sup></p>

<blockquote>
  <p><sup>4</sup> Herbert B. Enderton, “In Memoriam: Alonzo Church, 1903–1995,” <em>The Bulletin of Symbolic Logic</em>, Vol. 1, No. 4 (1995), 486–488。</p>
</blockquote>

<p>通常认为，邱奇建立了符号逻辑协会，因为他是《符号逻辑杂志》的第一位编辑。实际上，他并没有建立这个组织，而是指导杂志取得了辉煌的成功，最突出的是他编纂了重要的逻辑文献书目。</p>

<p>邱奇是在1927年至1929年作为国家研究院院士时开始<em>λ</em>演算的工作的。在那时，数学家们希望理解<strong>有效可计算性</strong>这个模糊的概念。为了知道数值计算的局限及能力，有必要用形式系统化的方式来定义函数，也就是说用符号、字符串和确定性规则来定义。最好的方法是什么呢？这种方法能否表明这些函数能够充分概括有效可计算性？</p>

<p>邱奇就这一方面的第一篇论文在1931年10月5日被《数学年鉴》收录，并在下一年的4月发表。<sup>5</sup>在这篇文章中，邱奇用了一个小写的 lambda（<em>λ</em>）来表示函数。</p>

<blockquote>
  <p><sup>5</sup> 阿隆佐·邱奇，“A Set of Postulates for the Foundation of Logic”，<em>The Annals of Mathematics</em>，2<sup>nd</sup> Series，Vol. 33，No. 2（Apr.1932），346-366。</p>
</blockquote>

<p>邱奇引入新记号的一个动机来自于传统函数表示的特定二义性。看看下面的表达式：</p>

<p style="text-align:center;"><i>x</i><sup>2</sup> + 5<i>x</i> + 7</p>

<p>就表达式本身而言，它在语法上是正确的，但我们仍不知道该对这个表达式做些什么，下面这个就清晰点了：</p>

<p style="text-align:center;"><i>f</i> (<i>x</i>) = <i>x</i><sup>2</sup> + 5 <i>x</i> + 7</p>

<p>这是传统的函数标记法，其中<em>x</em>是约束变量（或自变量）。我们可以按照自己的意愿任意改变约束变量，只要与函数表达式中的其他部分不冲突就行：</p>

<p style="text-align:center;"><i>f</i> (<i>y</i>) = <i>y</i><sup>2</sup> + 5 <i>y</i> + 7</p>

<p>我们可以使用表达式<em>f</em>(4)来表示函数的一个值，用4代替自变量<em>x</em>，并计算函数的值</p>

<p style="text-align:center;"><i>f</i> (4) = (4)<sup>2</sup> + 5· (4) +7 = 43</p>

<p>当你意识到这一点时可能会吃惊，那就是没有标准的形式可以将函数表达式（也就是<em>y</em> <sup>2</sup>+ 5 <em>y</em> + 7）与<em>y</em>的具体值一起表示出来。一旦我们用4替换了<em>y</em>，就丢失了自变量信息。如果你需要修复这样的缺点，并发展出一套表示取某个值的函数的方式，可能会想到这样的东西：</p>

<p style="text-align:center;">[ <i>y</i><sup>2</sup> + 5 <i>y</i> + 7] (4)</p>

<p>这其实不算太差，但是如果表达式中含有多个自变量呢？下面的表示就会让人不明就理：</p>

<p style="text-align:center;">[ <i>y</i><sup>2</sup> + 5 <i>y</i> +18 <i>x</i> - 2 <i>xy</i> + 7] (4)</p>

<p>即使你写成：</p>

<p style="text-align:center;">[ <i>y</i><sup>2</sup> + 5 <i>y</i> +18 <i>x</i> - 2 <i>xy</i> + 7] (4,5)</p>

<p>你假设对<em>x</em>和<em>y</em>按照特定顺序赋值。</p>

<p>在《数学原理》中，怀特海和罗素使用了抑扬符号来表示符合特定函数的类：<em>ŷ</em>。邱奇想把这个抑扬符号移到变量的前面，像^ <em>y</em>一样，但因为书写的原因，这个符号后来改成了lambda<sup>6</sup>：<em>λy</em>。</p>

<blockquote>
  <p><sup>6</sup> J. Barkley Rosser，“Highlights of the History of Lambda-Calculus”，<em>Annals of the History of Computing</em>，Vol. 6，No. 4（Oct.1984），337-349。</p>
</blockquote>

<p>多年来，邱奇的表示法已经有了发展。在下面的讨论中，我使用图灵在其论文附录中使用的表示法。一元变量的函数用下面这个通用形式表示：</p>

<p style="text-align:center;">λ<i>x</i>[ <i>M</i>]</p>

<p>其中<em>M</em>是包含自变量<em>x</em>的表达式。对于之前的例子，我们可以表示为：</p>

<p style="text-align:center;">λ<i>x</i>[ <i>x</i><sup>2</sup> + 5 <i>x</i> + 7]</p>

<p>一个包含特定自变量值的函数可以写成这个通用形式：</p>

<p style="text-align:center;">{<i>F</i>}(<i>A</i>)</p>

<p><em>F</em>是函数，如果<em>F</em>含有一个自变量，那么公式代表了函数，其中<em>A</em>代表函数中的自变量。例如，如果函数中的自变量为<em>x</em>，则通用形式为：</p>

<p style="text-align:center;">{λ<i>x</i>[ <i>M</i>]}(<i>A</i>)</p>

<p>将<em>M</em>替换为之前的函数，就变成了：</p>

<p style="text-align:center;">{λ<i>x</i>[ <i>x</i><sup>2</sup> + 5 <i>x</i> + 7]}(<i>A</i>)</p>

<p>若<em>x</em>的值为4，则可以将其写为：</p>

<p style="text-align:center;">{λ<i>x</i>[ <i>x</i><sup>2</sup> + 5 <i>x</i> + 7]}(<i>4</i>)</p>

<p>现在，我们已经成功地将函数和某个自变量的值表示在一起了。</p>

<p>含有两个自变量的函数有如下一般形式：</p>

<p style="text-align:center;">{{<i>F</i>}(<i>A</i>)}(<i>B</i>)</p>

<p>为了方便且可读性强，它可以简写为：</p>

<p style="text-align:center;">{<i>F</i>}(<i>A</i>, <i>B</i>)</p>

<p>如果将<em>F</em>替换为一个真正的函数，它看起来会是：</p>

<p style="text-align:center;">{λ<i>x</i> λ<i>y</i>[ <i>y</i><sup>2</sup> + 5 <i>y</i> +18 <i>x</i> - 2 <i>x</i>  <i>y</i> + 7]}(<i>A</i>, <i>B</i>)</p>

<p>我们现在知道<em>A</em>将替代<em>x</em>， <em>B</em>将替代<em>y</em>，它们以前面<em>λ</em>的排列顺序为准。</p>

<p>也可以再简写。如果没有歧义，可以去掉花括号，那么</p>

<p style="text-align:center;">{<i>F</i>}(<i>A</i>, <i>B</i>)</p>

<p>变成</p>

<p style="text-align:center;"><i>F</i> (<i>A</i>, <i>B</i>)</p>

<p>这看起来很像常规的函数表示法，但<em>F</em>表达式实际上包含了一些<em>λ</em>：</p>

<p style="text-align:center;">λ<i>x</i> λ<i>y</i>[ <i>M</i>] (<i>A</i>, <i>B</i>)</p>

<p>邱奇还允许将方括号替换为一个点，紧跟在<em>λ</em>串的后面：</p>

<p style="text-align:center;">λ<i>x</i> λ<i>y</i>. <i>M</i>( <i>A</i>, <i>B</i>)</p>

<p>这个形式会在接下来的大多数lambda表达式中出现。</p>

<p>邱奇在建立了基本的lambda表示法后，引入了常用逻辑算子的表达式和用于转换为等价公式的替换规则。邱奇以形式化方式定义了这些变换的规则，也可归结为：</p>

<p>Ⅰ. 如果新的自变量不与公式中的其他部分冲突，可以改变某个自变量（例如，<em>x</em>换为<em>y</em>）；</p>

<p>Ⅱ. 在公式{λ<em>x</em>. <em>M</em>}(<em>N</em>)中，如果<em>N</em>中不包含<em>x</em>的任何东西，那么可以将<em>N</em>替换到<em>M</em>中任何<em>x</em>出现的位置，这样公式就变成了用<em>N</em>替换原始的<em>x</em>所形成的<em>M</em>；</p>

<p>Ⅲ.Ⅱ的相反情况仍成立。</p>

<p>在第一篇lambda函数的论文发表一年半后，邱奇发表了第二篇论文<sup>7</sup>。他修正了其给出的假设，并强调：“整个系统的形式字符，使得从符号的本身意义进行抽象，以及将（形式逻辑的）定理证明看做是可以根据一套特定规则在纸上进行推导的游戏成为可能。”<sup>8</sup>这个理念很大程度上符合形式主义的传统。</p>

<blockquote>
  <p><sup>7</sup> 邱奇，“A Set of Postulates for the Foundation of Logic（Second Paper）”，<em>The Annals of Mathematics</em>，2<sup>nd</sup> Series，Vol. 34，No. 4（Oct. 1933），839-864。</p>
  
  <p><sup>8</sup> 邱奇，842。</p>
</blockquote>

<p>邱奇也引入了缩写conv来表示“通过转换”，指出利用规则Ⅰ、Ⅱ、Ⅲ可以将一个公式转换为等价形式，例如</p>

<p style="text-align:center;">λ<i>x</i> [<i>x</i><sup>2</sup> + 5 <i>x</i> + 7] (<i>A</i>)conv <i>A</i><sup>2</sup> + 5 <i>A</i> + 7</p>

<p>邱奇第二篇论文的最后是对正整数的研究。他使用了lambda表示法来定义符号1、后继、加运算、乘运算以及5个皮亚诺公理，并且声明道：“我们的纲领是要在之前所描述内容的基础上建立一套关于正整数的理论，然后，通过已知的方法或是进行适当的改变，将该理论推广到有理数以及实数领域。”<sup>9</sup></p>

<blockquote>
  <p><sup>9</sup> 邱奇，864。</p>
</blockquote>

<p>邱奇的学生斯蒂芬•科尔•克莱尼在约翰•巴克利•罗瑟（1907—1989）的帮助下继续下一步的研究。1934年，克莱尼所做的基础工作体现在“形式逻辑的例证”<sup>10</sup>一文中，并简化了多重lambda表示法。之前使用的</p>

<blockquote>
  <p><sup>10</sup> S. C. 克莱尼，“Proof by Cases in Formal Logic”，<em>The Annals of Mathematics</em>，2<sup>nd</sup> Series，Vol. 35，No. 3（July 1934），529-544。</p>
</blockquote>

<p style="text-align:center;">λ<i>x</i> λ<i>yM</i></p>

<p>现在可以使用</p>

<p style="text-align:center;">λ<i>xyM</i></p>

<p>来表示。</p>

<p>克莱尼于1935年改写并发表了他的博士论文“形式逻辑的正整数理论”，<sup>11</sup>该论文分为两部分。阅读这篇论文之前要先看邱奇的两篇论文以及克莱尼之前的论文，其第二部分也提及了即将发表的邱奇和罗瑟合作的论文。<sup>12</sup></p>

<blockquote>
  <p><sup>11</sup> S. C. 克莱尼，“A Theory of Positive Integers in Formal Logic，Part I”，<em>American Journal of Mathematics</em>，Vol. 57，No. 1（Jan. 1935），153-173；Vol. 57，No. 2（Apr. 1935），219-244。</p>
  
  <p><sup>12</sup> 邱奇和罗瑟，“Some Properties of Conversion”，<em>Transactions of the American Mathematical Society</em>，Vol. 39，No. 3（May 1936），472-482。</p>
</blockquote>

<p>尽管由邱奇、克莱尼、罗瑟一起发明的<em>λ</em>演算相当全面，既涉及逻辑又涉及算术，但是这里我只想集中探讨一些基本的算术，这样你就可以看到，如何通过单纯的字符运算来实现加法和乘法了。</p>

<p>定义自然数时，我们总是需要从0或1开始。邱奇和克莱尼是以1开始的，下面就是其符号：<sup>13</sup></p>

<blockquote>
  <p><sup>13</sup> 我将采用克莱尼的“A Theory of Positive Integers in Formal Logic, Part I”中前10页出现的定义。</p>
</blockquote>

<p style="text-align:center;">1 → λ<i>fx.f</i> (<i>x</i>)</p>

<p>这里箭头的意思是“代表”或“全称是”。这个公式看起来似乎有点怪，实际上可能看起来是非常怪，但这仅仅是一个定义，所以现在还没必要追究其意义。更冗长的版本是</p>

<p></p><p style="text-align:center;">1 → {λ<i>fx</i> [<i>f</i> (<i>x</i>)]}/p&gt;</p>

<p>因此，1实际上是一个含有两个自变量<em>f</em>和<em>x</em>的函数，非常唐突，定义一个数字居然需要额外多出的两个变量。</p>

<p>下面的是后继函数：</p>

<p style="text-align:center;"><i>S</i> → λ<i>ρfx.f</i>( <i>ρ</i>( <i>f</i>, <i>x</i>))</p>

<p>还是很奇怪吧，我也这么认为。尽管我们希望后继函数中包括自变量，但不希望其中包含3个自变量。</p>

<p>幸运的是，符号2可以定义成你期望的形式：</p>

<p style="text-align:center;">2 → <i>S</i>(1)</p>

<p>如果我们事实上想对1应用后继函数，就必须保证所有的自变量都是唯一的，因此要使用下面1的等价表达式：</p>

<p style="text-align:center;">1 → λ<i>ab.a</i>( <i>b</i>)</p>

<p>当使用<em>λ</em>表达式时，函数和变量经常互换角色。在下面变换后的公式的推导过程中，我选择性地使用花括号来标记将要在那一步被替换的包含一个自变量的函数。</p>

<p>函数<em>S</em>(1)也可以写为{<em>S</em>}1或者：</p>

<p style="text-align:center;">{λ<i>ρfx.f</i>( <i>ρ</i>( <i>f</i>, <i>x</i>))}(λ<i>ab.a</i>( <i>b</i>))</p>

<p>后继函数的第一个自变量为<em>ρ</em>，因此用1的表达式将函数中的<em>ρ</em>替换掉，<em>λ</em>后的<em>ρ</em>就消失了：</p>

<p style="text-align:center;">λ<i>fx.f</i>(λ<i>ab.a</i>( <i>b</i>)(<i>f</i>, <i>x</i>))</p>

<p>现在这个公式包含另一个函数，该函数中含有两个参数：</p>

<p style="text-align:center;">λ<i>fx.f</i>({λ<i>ab.a</i>( <i>b</i>)}(<i>f</i>, <i>x</i>))</p>

<p>用<em>f</em>替换<em>a</em>， <em>x</em>替换<em>b</em>：</p>

<p style="text-align:center;">λ<i>fx.f</i>( <i>f</i>( <i>x</i>))</p>

<p>这样就完成了。</p>

<p>尽管1最初定义为：</p>

<p style="text-align:center;">1 → λ<i>fx.f</i>( <i>x</i>)</p>

<p>数字2定义为：</p>

<p style="text-align:center;">2 → <i>S</i>(1)convλ<i>fx.f</i>( <i>f</i>( <i>x</i>))</p>

<p>比较转换后的2和1的表达式，你会发觉在点的右侧多出一个<em>f</em>和一对括号。现在使用不同的变量λ<em>ab.a</em>( <em>a</em>( <em>b</em>))来表示2，并尝试确定下一个后继数{<em>S</em>}(2):</p>

<p style="text-align:center;">{λ<i>ρfx.f</i>( <i>ρ</i>( <i>f</i>, <i>x</i>))}(λ<i>ab.a</i>( <i>a</i>( <i>b</i>)))</p>

<p>同样，用2来替代<em>ρ</em>：</p>

<p style="text-align:center;">λ<i>fx.f</i>({<i>λab.a</i>( <i>a</i>( <i>b</i>))}(<i>f</i>, <i>x</i>))</p>

<p>用<em>f</em>替换<em>a</em>， <em>x</em>替换<em>b</em>：</p>

<p style="text-align:center;">λ<i>fx.f</i>( <i>f</i>( <i>f</i>( <i>x</i>)))</p>

<p>这是3的<em>λ</em>表达式。我猜你开始明白这个模式了，我们最想从正整数的抽象表达式中得到的是某种后继性。下面这个记号表明了这一后继性：每一个后继整数都会增加对第一个自变量的嵌套。</p>

<p>克莱尼定义“加”运算为：</p>

<p style="text-align:center;">+ → λ<i>ρσfx.ρ</i>( <i>f</i>, <i>σ</i>( <i>f</i>, <i>x</i>))</p>

<p>有点怀疑了吧？我们试着将2和3相加。首先我们需要使所有的自变量不同。我将使用λ<em>ab.a</em>( <em>a</em>( <em>b</em>))代表2，λ<em>cd.c</em>( <em>c</em>( <em>c</em>( <em>d</em>)))代表3，因此{+}(2,3)就是：</p>

<p style="text-align:center;">{<i>λρσfx.ρ</i>( <i>f</i>, <i>σ</i>( <i>f</i>, <i>x</i>))}(<i>λab.a</i>( <i>a</i>( <i>b</i>)),<i>λcd.c</i>( <i>c</i>( <i>c</i>( <i>d</i>))))</p>

<p>在+函数中，用2的公式替换<em>ρ</em>，用3的公式替换<em>σ</em>：</p>

<p style="text-align:center;">λ<i>fx</i>.λ<i>ab.a</i>( <i>a</i>( <i>b</i>))(<i>f</i>,{λ<i>cd.c</i>( <i>c</i>( <i>c</i>( <i>d</i>)))}(<i>f</i>, <i>x</i>))</p>

<p>替换后的3是一个函数，其中用<em>f</em>替换<em>c</em>， <em>x</em>替换<em>d</em>：</p>

<p style="text-align:center;">λ<i>fx</i>.{λ<i>ab.a</i>( <i>a</i>( <i>b</i>))}(<i>f</i>, <i>f</i>( <i>f</i>( <i>f</i>( <i>x</i>))))</p>

<p>现在替换后的2是一个用<em>f</em>替代<em>a</em>，用<em>f</em>( <em>f</em>( <em>f</em>( <em>x</em>)))替代<em>b</em>的函数：</p>

<p style="text-align:center;">λ<i>fx.f</i>( <i>f</i>( <i>f</i>( <i>f</i>( <i>f</i>( <i>x</i>)))))</p>

<p>到这里，我们就完成了运算。答案与<em>S</em>( <em>S</em>( <em>S</em>( <em>S</em>(1))))一致，也就是5。</p>

<p>有意思的是，乘法函数比加法函数还要简单：</p>

<p style="text-align:center;">× → λ<i>ρσx.ρ</i>( <i>σ</i>( <i>x</i>))</p>

<p>我们来计算2和3的乘法，可以将{×}(2,3)写成：</p>

<p style="text-align:center;">{λ<i>ρσx.ρ</i>( <i>σ</i>( <i>x</i>))}(λ<i>ab.a</i>( <i>a</i>( <i>b</i>)),λ<i>cd.c</i>( <i>c</i>( <i>c</i>( <i>d</i>))))</p>

<p>用2的公式替换<em>ρ</em>，3的公式替换<em>σ</em>：</p>

<p style="text-align:center;">λ<i>x</i>λ <i>ab.a</i>( <i>a</i>( <i>b</i>))({λ<i>cd.c</i>( <i>c</i>( <i>c</i>( <i>d</i>)))}(<i>x</i>))</p>

<p>现在3变成一个用<em>x</em>替代<em>c</em>的函数：</p>

<p style="text-align:center;">λ<i>x</i>.{λ<i>ab.a</i>( <i>a</i>( <i>b</i>))}(λ<i>d.x</i>( <i>x</i>( <i>x</i>( <i>d</i>))))</p>

<p>现在2变成一个函数，用右侧的表达式替换<em>a</em>：</p>

<p style="text-align:center;">λ<i>x</i>.λ<i>b</i>.λ<i>d.x</i>( <i>x</i>( <i>x</i>( <i>d</i>)))({λ<i>d.x</i>( <i>x</i>( <i>x</i>( <i>d</i>)))}(<i>b</i>))</p>

<p>在右侧的函数，用<em>b</em>替换<em>d</em></p>

<p style="text-align:center;">λ<i>x</i>.λ<i>b</i>.{λ<i>d.x</i>( <i>x</i>( <i>x</i>( <i>d</i>)))}(<i>x</i>( <i>x</i>( <i>x</i>( <i>b</i>))))</p>

<p>最后替换<em>d</em>：</p>

<p style="text-align:center;">λ<i>xb.x</i>( <i>x</i>( <i>x</i>( <i>x</i>( <i>x</i>( <i>x</i>( <i>b</i>))))))</p>

<p>这就是6，当然也是2与3相乘的结果。</p>

<p>这些数字的函数定义可以让你做一些比较奇怪的事情，例如</p>

<p>{2}(3)</p>

<p>即：</p>

<p style="text-align:center;">{λ<i>ab.a</i>( <i>a</i>( <i>b</i>))}(λ<i>cd.c</i>( <i>c</i>( <i>c</i>( <i>d</i>))))</p>

<p>在你完成了所有费力的替换后，最后会得到：</p>

<p style="text-align:center;">λ<i>bd.b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>b</i>( <i>d</i>)))))))))</p>

<p>也就是9，毫无意外，这就是3的二次方。这也就是为什么<em>m</em>的<em>n</em>次方定义为：</p>

<p style="text-align:center;">λ<i>mn.nm</i></p>

<p>在这个系统中，乘比加看起来要简单，指数形式是其中最简单的。当邱奇、克莱尼和罗瑟使用<em>λ</em>演算做实验时，他们发现<em>λ</em>表示法可以表示任何他们能想到的东西，这是后来称为<em>λ</em>可定义性的性质。“邱奇一直在推断，并最后明确地提出，<em>λ</em>可定义函数是所有的有效可计算函数。”<sup>14</sup></p>

<blockquote>
  <p><sup>14</sup> 克莱尼，“Origins of Recursive Function Theory”，<em>Annals of the History of Computing</em>，Vol. 3，No. 1（Jan 1981），59。</p>
</blockquote>

<p>库尔特•哥德尔在1933年来到高级研究院。1934年春，他在普林斯顿讲授他的不完备性定理及递归函数，递归函数是从基本原始函数发展出来的。<sup>15</sup>让哥德尔对递归函数感兴趣的是雅克•赫尔布兰德（1908—1931）在1931年写给他的信，这位年轻聪明的法国数学家在攀登阿尔卑斯山时意外身亡了。</p>

<blockquote>
  <p><sup>15</sup> 根据克莱尼和罗瑟的笔录，哥德尔的讲义早已在内部流传，但直到1965年才正式出版在马丁·戴维斯，ed.，<em>The Undecidable</em>（Raven Press，1965），41-71中。接着它们又被出版在库尔特·哥德尔，<em>Selected Works: Volume I, Publications 1929-1936</em>（Oxford University Press，1986），346-371。</p>
</blockquote>

<p>尽管如此，哥德尔在那时仍然坚信，<em>λ</em>函数和递归函数都不足以包含所有我们认为的非正式有效可计算性。</p>

<p>1936年，邱奇发表了“初等数论的不可解问题”<sup>16</sup>，在这篇文章中首次出现了“<em>λ</em>可定义”一词。（之前，克莱尼在使用lambda记号表示逻辑和算术运算时仅仅使用了“可定义”或者“形式可定义”。）邱奇引用了自己之前的论文、克莱尼的两篇论文，以及克莱尼即将发表的探讨递归函数和<em>λ</em>可定义函数之间关系的论文。<sup>17</sup>与哥德尔构造了一个不可判定的命题一样，邱奇使用哥德尔的记数法同样构造了一个不可解的问题。</p>

<blockquote>
  <p><sup>16</sup> 邱奇，“An Unsolvable Problem of Elementary Number Theory”，<em>American Journal of Mathematics</em>，Vol. 58，No.2（Apr. 1936），345-363。</p>
  
  <p><sup>17</sup> 克莱尼，“General Recursive Functions of Natural Numbers”，<em>Mathematische Annalen</em>，Vol. 112，No.1（Dec.1936），727-742，重印于马丁·戴维斯，ed.，<em>The Undecidable</em>（Raven Press，1965），237-252。S. C. 克莱尼，“λ-Definability and Recursiveness”，<em>Duke Mathematical Journal</em>，Volume 2，Number 2（1936），340-353。</p>
</blockquote>

<p>在此基础上，邱奇在《符号逻辑期刊》（他自己也是该期刊的编辑）的首版上发表了两页的“判定性问题的笔记”，他在结论中写道：“判定性问题的通用情况是不可解的。”<sup>18</sup>这篇文章是在1936年4月15日被杂志接收的，比图灵在1936年5月28日提交到伦敦数学学会的文章早了6周。</p>

<blockquote>
  <p><sup>18</sup> 邱奇，“A Note on the Entscheidungsproblem”，<em>The Journal of Symbolic Logic</em>，Vol. 1，No. 1（Mar. 1936），40-41。也可参见邱奇，“Correction to a Note on the Entscheidungsproblem”，<em>The Journal of Symbolic Logic</em>，Vol. 1，No. 3（Sep. 1936），101-102。</p>
</blockquote>

<p>1936年夏，图灵可能花了大部分时间阅读我之前提到的邱奇和克莱尼的文章，学习<em>λ</em>演算，并验证它如何与自己的计算机器相关联。据显示，图灵的三页附录在8月28日被伦敦数学学会接收。图灵在最后写上了：“美国新泽西州普林斯顿大学研究生院。”他很期待自己的新家。直到9月23日，他才离开英国前往美国，在29日到达纽约。<sup>19</sup></p>

<blockquote>
  <p><sup>19</sup> 安德鲁·霍奇斯，<em>Alan Turing: The Enigma</em>（Simon &amp; Schuster，1983），116。</p>
</blockquote>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.01.png" width="600"></p>

<blockquote>
  <p>1936年8月28日新增</p>
  
  <p style="text-align:center;"><b>附录</b></p>
  
  <p style="text-align:center;">可计算性和有效可计算性</p>
  
  <p>所有的有效可计算（<em>λ</em>可定义）序列都是可计算的，反之也成立。这个定理的证明将在下面简略给出。</p>
</blockquote>

<p>在这里，“简略”的意思是证明中会跳过一些步骤。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.02.png" width="600"></p>

<blockquote>
  <p>假设人们已经理解了邱奇和克莱尼所使用的“合式公式”（W.F.F.）和“转换”这些术语。在第二个证明中，我们假定了一些公式已经存在，不再证明。这些公式可以参考克莱尼的论文“形式逻辑的正整数理论”[发表在《美国数学杂志》57（1935），153-173，219-244]直接构造。</p>
</blockquote>

<p>图灵这里说的“第二个证明”是指上述定理的逆命题：每一个可计算序列同样也是<em>λ</em>可定义的。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.03.png" width="600"></p>

<blockquote>
  <p>表示一个整数<em>n</em>的W.F.F.将记为<em>N</em><sub><em>n</em></sub>。</p>
</blockquote>

<p>我们开始使用克莱尼对1和后继数字的定义，但要使这些自变量与图灵后面使用的保持一致，<em>N</em><sub>1</sub>是λ<em>xy.x</em>( <em>y</em>)，<em>N</em><sub>2</sub>是λ<em>xy.x</em>( <em>x</em>( <em>y</em>))，<em>N</em><sub><em>n</em></sub>是λ<em>xy.x</em>( <em>x</em>( <em>x</em>( <em>x</em>...(<em>y</em>)...)))。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.04.png" width="600"></p>

<blockquote>
  <p>如果1+<em>φ</em><sub><em>γ</em></sub>(<em>u</em>)是<em>n</em>的 <em>λ</em>可定义函数，我们就称第<em>n</em>个数字为<em>φ</em><sub><em>γ</em></sub>(<em>n</em>)的序列<em>γ</em>是 <em>λ</em>可定义的或者是有效可计算的。</p>
</blockquote>

<p><em>φ</em><sub><em>r</em></sub>两次出现时的参数都应该是<em>n</em>，而不是<em>u</em>，因此表达式应该是1+<em>φ</em><sub><em>γ</em></sub>(<em>n</em>)。可计算序列<em>γ</em>的第<em>n</em>位是0或者1，但邱奇和克莱尼定义的<em>λ</em>演算只考虑了正整数，并不包括0。<em>φ</em><sub><em>γ</em></sub>(<em>n</em>)并不是<em>λ</em>可定义的，因为0不是<em>λ</em>可定义的。所以，数字都加上1变成1和2。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.05.png" width="600"></p>

<blockquote>
  <p>如果存在W.F.F. <em>M</em><sub><em>γ</em></sub>，使得对于所有的整数<em>n</em>，</p>
  
  <p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)conv <i>N</i><sub><i>φ</i><sub><i>γ</i></sub>(<i>n</i>)+1</sub></p>
  
  <p>即根据<em>λ</em>的第<em>n</em>位数是1还是0，{<em>M</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>n</em></sub>)可以转换为λ<em>xy.x</em>( <em>x</em>( <em>y</em>))或者λ<em>xy.x</em>( <em>y</em>)。</p>
</blockquote>

<p>最后一行的<em>λ</em>其实是错的，应该是“<em>γ</em>的第<em>n</em>位数”。根据对应的数字是1还是0，值<em>N</em><sub><em>n</em></sub>（指序列中的数字位）处的函数<em>M</em><sub><em>γ</em></sub>可转换为λ<em>xy.x</em>( <em>x</em>( <em>y</em>))（也就是2）或者λ<em>xy.x</em>( <em>y</em>)（也就是1）。</p>

<p>例如，如果<em>γ</em>的第5位是1，那么<em>φ</em><sub><em>γ</em>(5)</sub>是1，并且</p>

<p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub>5</sub>)conv <i>N</i><sub><i>φ</i><sub><i>γ</i></sub>(5)+1</sub></p>

<p>也就是说</p>

<p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub>5</sub>)conv <i>N</i><sub>2</sub></p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.06.png" width="600"></p>

<blockquote>
  <p>为了证明每一个<em>λ</em>可定义序列<em>γ</em>都是可计算的，我们必须首先构造一个可以计算<em>γ</em>的机器。使用机器，可以方便地在演算转换中进行简单的修改，这些修改包括使用<em>x</em>， <em>x</em>'，<em>x</em>''，...作为变量，而不是使用<em>a</em>， <em>b</em>， <em>c</em>，...。</p>
</blockquote>

<p>图灵至今还未使用任何以<em>a</em>、 <em>b</em>或 <em>c</em>命名的变量，但他使用了<em>x</em>和 <em>y</em>。他希望所有的变量都具有统一的形式，因为接下来需要进行比较和匹配。这与第8节的要求很相似（本书第205页）：一阶谓词逻辑在被机器处理前需要“系统化”。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.07.png" width="600"></p>

<blockquote>
  <p>我们现在构造一台机器<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15">，在提供了公式<em>M</em><sub><em>γ</em></sub>时可以写下序列<em>γ</em>。<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15">的构造过程与<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.09.png" width="20">在某种程度上很相似，<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.09.png" width="20">证明了函数演算中所有可证明的公式。我们首先构造一个选择机器<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>1</sub>，如果给<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>1</sub>提供了一个W.F.F.，例如<em>M</em>，并合理调整，使<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>1</sub>包含任一<em>M</em>可转换到的公式，则可以调整<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>1</sub>使之衍生出自动机器<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>2</sub>，<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>2</sub>相继得到所有<em>M</em>可转换到的公式（参见第252页脚注）。</p>
</blockquote>

<p>在图灵论文的第252页有5个脚注，图灵引用的是第二个（本书第205页）。在那里，他讨论了可以证明所有一阶逻辑的可证明公式的机器。考虑到<em>λ</em>表达式转换的系统化方式，这台机器看起来与之相似，很可能更加简单。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.10.png" width="600"></p>

<blockquote>
  <p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>2</sub>是机器<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15">的一部分。提供公式<em>M</em><sub><em>γ</em></sub>时，<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15">的操作可以划分为很多部分，其中第<em>n</em>部分用来寻找<em>γ</em>的第<em>n</em>位。第<em>n</em>部分的第一阶段是公式{<em>M</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>n</em></sub>)。这个公式接下来提供给<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>2</sub>用来将公式连续地转换为其他公式。每一个可转换的公式都会最终出现，并与下列公式进行比较：</p>
  
  <p>λ<em>x</em>[λ<em>x</em>'[{<em>x</em>}({<em>x</em>}(<em>x</em>'))]]，即<em>N</em><sub>2</sub>，</p>
  
  <p>及λ<em>x</em>[λ<em>x</em>'[{<em>x</em>}(<em>x</em>')]]，即<em>N</em><sub>1</sub>。</p>
</blockquote>

<p>这就是数字2和1的冗长的表达式。为了实现一个可以转换<em>λ</em>表达式的机器，你必须在表示法中保持一致，而不包含语法捷径的方法实际上是最简单的。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.11.png" width="600"></p>

<blockquote>
  <p>如果与第一个完全一样，那么机器打印1，第<em>n</em>部分完成。如果与第二个相同，那么打印0，这部分也结束了。如果与这两个都不一样，那么<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.08.png" width="15"><sub>2</sub>的工作就要重新开始。根据假设，{<em>M</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>n</em></sub>)是可以转换为公式<em>N</em><sub>2</sub>或者<em>N</em><sub>1</sub>，因此第<em>n</em>部分最终是会结束的，也就是说，<em>γ</em>的第<em>n</em>位最终会写出来。</p>
</blockquote>

<p>在开始更加复杂的变换证明之前，图灵空了一行：如何设计一个能包括特定机器运转情况的<em>λ</em>表达式。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.12.png" width="600"></p>

<blockquote>
  <p>为了证明每一个可计算序列<em>γ</em>都是<em>λ</em>可定义的，我们必须先说明如何找到一个公式<em>M</em><sub><em>γ</em></sub>，对于所有的整数<em>n</em>，</p>
  
  <p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)conv <i>N</i><sub>1+<i>φ</i><sub><i>γ</i></sub>(<i>n</i>)</sub></p>
</blockquote>

<p>这个公式正好和之前那个一样，只是最后那个<em>N</em>的下标被重排了。现在，要做的不是描述一个操作<em>λ</em>函数的机器，而是定义一个模拟机器的<em>λ</em>函数。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.13.png" width="600"></p>

<blockquote>
  <p>假设<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.14.png" width="20">是一台计算<em>γ</em>的机器，我们来用数字描述一下<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.14.png" width="20">的完全格局。正如§6中描述的，我们可以得到完全格局的描述数。</p>
</blockquote>

<p>在下面的讨论中，我将会引用到“格局数”，这其实就是简单的连续整数0, 1, 2, 3等，这个数字随机器运转而递增。对于任何一个特定的机器，对每个格局数，存在一个与完全格局对应的描述数。这些是非常大的数字，包括了描述纸带上已打印数字及下一个m-格局的代码。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.15.png" width="600"></p>

<blockquote>
  <p>令<em>ξ</em>( <em>n</em>)为<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.14.png" width="20">的第<em>n</em>个完全格局的描述数。</p>
</blockquote>

<p>图灵在这里使用的<em>n</em>是我所指的格局数，而<em>ξ</em>( <em>n</em>)是一个描述数。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.16.png" width="600"></p>

<blockquote>
  <p>从<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.14.png" width="20">的格局表中，我们可以得到<em>ξ</em>( <em>n</em>+1)及<em>ξ</em>( <em>n</em>)之间的如下关系：</p>
  
  <p style="text-align:center;"><i>ξ</i>( <i>n</i>+1) = <i>ρ</i><sub><i>γ</i></sub>(<i>ξ</i>( <i>n</i>))</p>
  
  <p>其中<em>ρ</em><sub><em>γ</em></sub>是一个严格受限的函数，尽管通常不是很简单：其形式由<img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.14.png" width="20">的格局表决定。</p>
</blockquote>

<p><em>ρ</em><sub><em>γ</em></sub>函数将一个描述数转换为下一个描述数。一般来讲，输入是一个长的数字，输出是另一个长的数字。这个函数基本上必须在这个长输入数中，寻找一组对应于m-格局和扫描符的特定模式的数字，并基于格局表构造下一个完全格局，有可能包含一个新的打印符号，并改变m-格局和下一个扫描符。</p>

<p>图灵对于这个函数的“通常不是很简单”的描述切中目标。这个函数需要将描述数拆分为单个数位并验证它们。因为描述数是十进制数，所以这个函数可以通过先将数字除以10的幂，忽略分数部分，再除以另一个10的幂，保留余数，来抽取其中任意长度的部分。尽管<em>ρ</em><sub><em>γ</em></sub>函数毫无疑问是很复杂的，但它肯定是能被想到的。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.17.png" width="600"></p>

<blockquote>
  <p><em>ρ</em><sub><em>γ</em></sub>是<em>λ</em>可定义的（我略去了这部分的证明），即存在一个合式公式<em>A</em><sub><em>γ</em></sub>，对于所有的整数<em>n</em>：</p>
  
  <p style="text-align:center;">{<i>A</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>ξ</i>( <i>n</i>)</sub>)conv <i>N</i><sub><i>ξ</i>( <i>n</i>+1)</sub></p>
</blockquote>

<p><em>A</em><sub><em>γ</em></sub>本质上是与<em>ρ</em><sub><em>γ</em></sub>一样的函数，只不过是用<em>λ</em>演算的语言表示的。它用来进行描述数间的转换。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.18.png" width="600"></p>

<blockquote>
  <p>令<em>U</em>表示</p>
  
  <p style="text-align:center;">λ<i>u</i>[{{<i>u</i>}(<i>A</i><sub><i>γ</i></sub>)}(<i>N</i><sub><i>r</i></sub>)]，</p>
  
  <p>其中<em>r</em>= <em>ξ</em>(0)</p>
</blockquote>

<p>这句开头的大写<em>U</em>应该有一个下标<em>γ</em>，因为它是基于一个特定可计算序列的。<em>N</em><sub><em>r</em></sub>是机器开始时的完全格局的描述数——数字313。这个数字对应于标准描述DAD，意思是m-格局<em>q</em><sub>1</sub>（DA）和扫描一个空格（D）。变量<em>u</em>是格局数，随着机器运行依次是0、1、2等。包含<em>u</em>的是个花括号，通常意味着是个函数，虽然看起来似乎没什么意义，但很快你就将看到它很有效。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.19.png" width="600"></p>

<blockquote>
  <p>那么，对于所有的整数<em>n</em>，</p>
  
  <p style="text-align:center;">{<i>U</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)conv <i>N</i><sub><i>ξ</i>( <i>n</i>)</sub></p>
</blockquote>

<p><em>U</em><sub><em>γ</em></sub>函数的参数是格局数（0，1，2等）。图灵认为，这个函数可以转换为那个格局的描述数。我们使用描述数4来验证一下，其中需要涉及转换表达式{<em>U</em><sub><em>γ</em></sub>}(<em>N</em><sub>4</sub>)，即：</p>

<p style="text-align:center;">{λ<i>u</i>[{{<i>u</i>}(A<sub><i>γ</i></sub>)}(<i>N</i><sub><i>ξ</i>(0)</sub>)]}(λ<i>xy.x</i>( <i>x</i>( <i>x</i>( <i>x</i>( <i>y</i>)))))</p>

<p>在<em>U</em><sub><em>γ</em></sub>函数中，我使用了<em>N</em><sub><em>ξ</em>(0)</sub>而不是<em>N</em><sub><em>r</em></sub>，正因如此，我们不会忘记下标代表了描述数。用4的表达式替换函数中的<em>u</em>：</p>

<p style="text-align:center;">{{λ<i>xy.x</i>( <i>x</i>( <i>x</i>( <i>x</i>( <i>y</i>))))}(<i>A</i><sub><i>γ</i></sub>)}(<i>N</i><sub><i>ξ</i>(0)</sub>)</p>

<p>现在将<em>x</em>替换为<em>A</em><sub><em>γ</em></sub>：</p>

<p style="text-align:center;">{λ<i>y.A</i><sub><i>γ</i></sub>( <i>A</i><sub><i>γ</i></sub>( <i>A</i><sub><i>γ</i></sub>( <i>A</i><sub><i>γ</i></sub>( <i>y</i>))))}(<i>N</i><sub><i>ξ</i>(0)</sub>)</p>

<p>最后我们用<em>N</em><sub><em>ξ</em>(0)</sub>替换<em>y</em>：</p>

<p style="text-align:center;"><i>A</i><sub><i>γ</i></sub>(<i>A</i><sub><i>γ</i></sub>(<i>A</i><sub><i>γ</i></sub>(<i>A</i><sub><i>γ</i></sub>(<i>N</i><sub><i>ξ</i>(0)</sub>))))</p>

<p><em>A</em><sub><em>γ</em></sub>在<em>N</em><sub><em>ξ</em>(0)</sub>上第一个应用的结果是<em>N</em><sub><em>ξ</em>(1)</sub>，下一次得到<em>N</em><sub><em>ξ</em>(2)</sub>，等等，因此最后的结果就是<em>N</em><sub><em>ξ</em>(4)</sub>，这和图灵预想的一样。现在，你就可以看出为什么将<em>u</em>定义为<em>U</em><sub><em>γ</em></sub>中的函数是有意义的了：它可以在根本上将出现在<em>A</em><sub><em>γ</em></sub>函数中的<em>u</em>混合嵌套。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.20.png" width="600"></p>

<blockquote>
  <p>可以证明，对于公式<em>V</em>，有</p>
  
  <p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.21.png" width="550"></p>
</blockquote>

<p>函数<em>V</em>基本上分析了连续两个完全格局的描述数，并确定打印0或者1，或者什么都不打印，这又是一个复杂但可以想到的函数。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.22.png" width="600"></p>

<blockquote>
  <p>令<em>W</em><sub><em>γ</em></sub>表示</p>
  
  <p style="text-align:center;">λ<i>u</i>[{{<i>V</i>}({<i>A</i><sub><i>γ</i></sub>}({<i>U</i><sub><i>γ</i></sub>}(<i>u</i>)))}({<i>U</i><sub><i>γ</i></sub>}(<i>u</i>))]，</p>
  
  <p>因此，对于任意一个整数<em>n</em>，</p>
  
  <p style="text-align:center;">{{<i>V</i>}(<i>N</i><sub><i>ξ</i>( <i>n</i>+1)</sub>)}(<i>N</i><sub><i>ξ</i>( <i>n</i>)</sub>)conv{<i>W</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)，</p>
</blockquote>

<p>这个命题左侧的公式可以转换为<em>N</em><sub>1</sub>、<em>N</em><sub>2</sub>或 <em>N</em><sub>3</sub>中的一个。描述这种变换比较容易，可以先描述转换后的结果：</p>

<p style="text-align:center;">{<i>W</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)</p>

<p>将<em>W</em><sub><em>γ</em></sub>替换为图灵刚刚给出的那个表达式</p>

<p style="text-align:center;">{λ<i>u</i>[{<i>V</i>}({<i>A</i><sub><i>γ</i></sub>}({<i>U</i><sub><i>γ</i></sub>}(<i>u</i>)))}({<i>U</i><sub><i>γ</i></sub>}(<i>u</i>)]}(<i>N</i><sub><i>n</i></sub>)</p>

<p>用<em>N</em><sub><em>n</em></sub>代替<em>u</em>：</p>

<p style="text-align:center;">{{<i>V</i>}({A<sub><i>γ</i></sub>}({U<sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)))}({U<sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>))</p>

<p>表达式{U<sub><em>γ</em></sub>}(<em>N</em><sub><em>n</em></sub>)可以转换为<em>N</em><sub><em>ξ</em>( <em>n</em>)</sub>，因此：</p>

<p style="text-align:center;">{{<i>V</i>}({<i>A</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>ξ</i>( <i>n</i>)</sub>))}(<i>N</i><sub><i>ξ</i>( <i>n</i>)</sub>)</p>

<p>表达式{<em>A</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>ξ</em>( <em>n</em>)</sub>)可以转换为<em>N</em><sub><em>ξ</em>( <em>n</em>+1)</sub>，这正是我们所求的：</p>

<p style="text-align:center;">{{<i>V</i>}({<i>N</i><sub><i>ξ</i>( <i>n</i>+1)</sub>)}(<i>N</i><sub><i>ξ</i>( <i>n</i>)</sub>)</p>

<p>通过这个简短的证明，我们可以知道{<em>W</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>n</em></sub>)可以转换为<em>N</em><sub>1</sub>、<em>N</em><sub>2</sub>或 <em>N</em><sub>3</sub>，这取决于第<em>n</em>个完全格局转换为第<em>n</em>+1个时打印的是0还是1，或是什么都不打印。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.23.png" width="600"></p>

<blockquote>
  <p>令<em>Q</em>是一个公式，使得</p>
  
  <p style="text-align:center;">{{Q}(<i>W</i><sub><i>γ</i></sub>)}(<i>N</i><sub><i>s</i></sub>)conv <i>N</i><sub><i>r</i>( <i>z</i>)</sub>，</p>
  
  <p>其中<em>r</em>( <em>s</em>)是第<em>s</em>个整数<em>q</em>，其中{<em>W</em><sub><em>γ</em></sub>}(<em>N</em><sub><em>q</em></sub>)转换为<em>N</em><sub>1</sub>或<em>N</em><sub>2</sub>。</p>
</blockquote>

<p>在上面的公式中，最后一个<em>N</em>的下标明显应该是<em>r</em>( <em>s</em>)而不是<em>r</em>( <em>z</em>)。只有一部分的完全格局才会打印0或者1，函数<em>r</em>( <em>s</em>)就是用来揭示这些完全格局的。例如，如果在1、4、6、7等完全格局中打印了0或者1，那么<em>r</em>(1)返回1，<em>r</em>(2)返回4，<em>r</em>(3)返回6，<em>r</em>(4)返回7，等等。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.24.png" width="600"></p>

<blockquote>
  <p>如果<em>M</em><sub><em>γ</em></sub>表示</p>
  
  <p style="text-align:center;">λ<i>w</i>[{<i>W</i><sub><i>γ</i></sub>}({{<i>Q</i>}(<i>W</i><sub><i>γ</i></sub>)}(<i>w</i>))]，</p>
  
  <p>那么它将具备所需要的性质。<sup>†</sup></p>
  
  <hr>
  
  <p><sup>†</sup> 在可计算序列的<em>λ</em>可定义性的完整证明中，最好改变这个方法，用我们的机器能够很好处理的描述代替完全格局的数字描述。我们选择某些整数来代表这些符号和机器的m-格局。假设在特定的完全格局中，那些代表纸带上后续符号的数字是<em>S</em><sub>1</sub><em>S</em><sub>2</sub>...<em>S</em><sub><em>n</em></sub>，其中第<em>m</em>个符号被扫描到，m-格局的标号为<em>t</em>，那么我们可以用下面的公式表示这个完全格局</p>
  
  <p style="text-align:center;">[[<i>N</i><sub><i>S</i><sub>1</sub></sub>,<i>N</i><sub><i>S</i><sub>2</sub></sub>,...<i>N</i><sub><i>S</i><sub><i>m</i>-1</sub></sub>],[<i>N</i><sub><i>t</i></sub>,<i>N</i><sub><i>S</i><sub><i>m</i></sub></sub>],[<i>N</i><sub><i>S</i><sub><i>m</i>+1</sub></sub>,...,<i>N</i><sub><i>S</i><sub><i>n</i></sub></sub>]]，</p>
  
  <p>其中</p>
  
  <p style="text-align:center;">[<i>a</i>, <i>b</i>]代表λ<i>u</i>[{{<i>u</i>}(<i>a</i>)}(<i>b</i>)]</p>
  
  <p style="text-align:center;">[<i>a</i>, <i>b</i>, <i>c</i>]代表λ<i>u</i>[{{{<i>u</i>}(<i>a</i>)}(<i>b</i>)}(<i>c</i>)]，</p>
  
  <p>等等。</p>
</blockquote>

<p>在图灵证明的第二部分，他开始自己寻找公式<em>M</em><sub><em>γ</em></sub>，使得对于所有<em>n</em>，</p>

<p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)conv <i>N</i><sub>1+<i>φ</i><sub><i>γ</i></sub>(<i>n</i>)</sub></p>

<p>这个公式告诉我们序列的第<em>n</em>位是0还是1。我们先来分析：</p>

<p style="text-align:center;">{<i>M</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>n</i></sub>)</p>

<p>用图灵刚刚为<em>M</em><sub><em>γ</em></sub>推导出的公式代替之：</p>

<p style="text-align:center;">{λ<i>w</i>[{<i>W</i><sub><i>γ</i></sub>}({{<i>Q</i>}(<i>W</i><sub><i>γ</i></sub>))}(<i>w</i>))]}(<i>N</i><sub><i>n</i></sub>)</p>

<p>用<em>N</em><sub><em>n</em></sub>替代<em>w</em>：</p>

<p style="text-align:center;">{<i>W</i><sub><i>γ</i></sub>}({{<i>Q</i>}(<i>W</i><sub><i>γ</i></sub>))}(<i>N</i><sub><i>n</i></sub>))</p>

<p>括号中的表达式可以转换为<em>N</em><sub><em>r</em>( <em>n</em>)</sub>，因此</p>

<p style="text-align:center;">{<i>W</i><sub><i>γ</i></sub>}(<i>N</i><sub><i>r</i>( <i>n</i>)</sub>)</p>

<p>已经表明，这个公式可以转换为<em>N</em><sub>1</sub>、<em>N</em><sub>2</sub>或<em>N</em><sub>3</sub>，这主要取决于完全格局<em>r</em>( <em>n</em>)打印的是0或1或其他。然而，<em>r</em>( <em>n</em>)定义了只有在完全格局打印了0和1的情况下才返回。</p>

<p>上面的脚注表明，完全格局在纸带上被分为了下一个扫描符之前部分及下一个扫描符之后部分。图灵所建议的用来表示纸带这些部分的<em>λ</em>表达式可以是非常长，并且大小会随着完全格局的增长而增长。</p>

<p>下面是论文的结尾。</p>

<p><img src="http://www.ituring.com.cn/figures/2012/The%20Annotated%20Turing/18.D15Z.25.png" width="600"></p>

<blockquote>
  <p>研究生院，</p>
  
  <p>　普林斯顿大学，</p>
  
  <p>　　美国新泽西州。</p>
</blockquote>

<p>对于更加严格的证明，图灵并没有遵循他在这里概述的证明逆命题的思路。论文“可计算性和<em>λ</em>可定义性”于1937年9月11日被《符号逻辑杂志》收录，这时距他抵达普林斯顿还不到一年的时间。<sup>20</sup>文章开始写道：</p>

<blockquote>
  <p>我们已经给出了许多定义用来表述与“有效计算性”的直观思路相对应的确切含义，并将其应用到了正整数函数中。这篇论文的意图是为了表明作者所介绍的可计算函数与邱奇发明的<em>λ</em>可定义的函数，以及与由赫尔布兰德和哥德尔引入并由克莱尼发展的一般递归函数是一致的。（在本论文中）已表明，任意的<em>λ</em>可定义函数都是可计算的，并且每一个可计算函数是一般递归函数。</p>
  
  <p><sup>20</sup> 阿兰·图灵，“Computability and λ-Definability”，<em>The Journal of Symbolic Logic</em>，Vol. 2，No. 4（Dec. 1937），pp.153-163。</p>
</blockquote>

<p>图灵首先通过给出一台图灵机来证明<em>λ</em>可定义函数是可计算的。这台图灵机可能比图灵的通用机更复杂，它可以解析和转换<em>λ</em>函数。</p>

<p>证明的第二部分展示了可计算函数是递归的。图灵并不需要证明可计算函数是<em>λ</em>可定义的，因为斯蒂芬•克莱尼已经证明了递归函数是<em>λ</em>可定义的（在“<em>λ</em>可定义性和递归”一文中）。这样，有效计算性的三个定义被等价地联系起来了。</p>

<p>图灵后来经常提到他1935年夏躺在格兰切斯特庄园草地上时构想出来的这些神奇的虚拟机器，但是在他后续发表的论文中并没有给出机器的实际格局表。当他在邱奇的指导下写博士论文时，<sup>21</sup>论文内容已经完全与递归函数和<em>λ</em>函数相关了。</p>

<blockquote>
  <p><sup>21</sup> 阿兰·图灵，“Systems of Logic Based on Ordinals”，<em>Proceedings of the London Mathematical Society</em>，2<sup>nd</sup> Series，Vol.  45，No.1（1939），161-228。</p>
</blockquote>
<p></p>
                        </div>
                    </div>
                </div>