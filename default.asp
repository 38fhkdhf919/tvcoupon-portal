<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title id="page-title">TV쿠폰 상세 혜택 - 대한민국 No.1 모바일 할인포털</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="icon" type="image/svg+xml" href="/favicon.svg">
    <style>body { font-family: 'Noto Sans KR', sans-serif; background-color: #f8fafc; color: #1e293b; }</style>
</head>
<body class="min-h-screen flex flex-col">

    <!-- Header -->
    <header class="bg-white border-b border-slate-200 shadow-sm sticky top-0 z-50">
        <div class="max-w-5xl mx-auto px-4 h-16 flex items-center justify-between">
            <a href="/" class="flex items-center gap-2">
                <div class="w-8 h-8 rounded-lg bg-rose-600 flex items-center justify-center text-white font-black text-sm">TV</div>
                <span class="text-lg font-black text-slate-900">TV<span class="text-rose-600">COUPON</span></span>
            </a>
            <div class="flex items-center gap-3">
                <a href="/" class="text-xs font-bold text-slate-600 hover:text-rose-600">홈으로</a>
                <a href="/archive/" class="text-xs font-bold text-slate-600 hover:text-rose-600">전체 아카이브</a>
            </div>
        </div>
    </header>

    <!-- Main Detail Content -->
    <main class="flex-1 max-w-4xl mx-auto px-4 py-10 w-full">
        <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 sm:p-10 mb-8">
            <div class="flex items-center gap-2 mb-3">
                <span id="deal-category" class="px-2.5 py-0.5 rounded-full text-xs font-bold bg-rose-50 text-rose-600">쿠폰 상세</span>
                <span id="deal-date" class="text-xs text-slate-400 font-semibold">2026.08.27</span>
                <span class="text-xs text-slate-400 ml-auto font-medium"><i class="far fa-eye mr-1"></i> 조회 <span id="deal-views">1,450</span></span>
            </div>

            <h1 id="deal-title" class="text-2xl sm:text-3xl font-black text-slate-900 leading-snug mb-6">
                쿠폰 정보를 불러오는 중입니다...
            </h1>

            <div class="p-4 rounded-xl bg-slate-50 border border-slate-100 mb-8 flex flex-col sm:flex-row items-center justify-between gap-4">
                <div>
                    <span class="text-xs text-slate-400 font-semibold block mb-1">혜택 가격 정보</span>
                    <div class="flex items-baseline gap-2">
                        <span id="deal-discount" class="text-rose-600 font-black text-2xl"></span>
                        <span id="deal-price" class="text-slate-900 font-black text-2xl"></span>
                    </div>
                </div>
                <div>
                    <button onclick="alert('바코드가 정상 발급되었습니다. 해당 가맹점 결제 시 제시해 주세요.')"
                            class="px-6 py-3 rounded-xl bg-rose-600 hover:bg-rose-700 text-white font-bold text-sm shadow-md transition">
                        모바일 바코드 발급받기
                    </button>
                </div>
            </div>

            <div id="deal-content" class="prose max-w-none text-slate-700 leading-relaxed text-base space-y-4 mb-8">
                <!-- Injected via JS -->
            </div>

            <div class="p-5 rounded-xl bg-slate-50 border border-slate-200">
                <h4 class="font-bold text-slate-800 text-sm mb-2"><i class="fas fa-info-circle text-rose-600 mr-1"></i> TV쿠폰 공식 이용안내</h4>
                <ul class="text-xs text-slate-600 space-y-1.5 list-disc list-inside">
                    <li>발급 유효기간: 발급일로부터 90일간 유효합니다.</li>
                    <li>사용 방법: 전국 해당 브랜드 매장 및 공식 배달/온라인 앱 결제창에 등록</li>
                    <li>환불/취소 정책: 미사용 시 100% 전액 자동 연장 또는 취소 환불 처리</li>
                </ul>
            </div>
        </div>

        <div class="text-center">
            <a href="/" class="inline-flex items-center gap-2 px-6 py-3 rounded-xl bg-white border border-slate-200 text-slate-700 font-bold text-sm hover:border-rose-500 transition">
                <i class="fas fa-arrow-left text-xs"></i> <span>목록으로 돌아가기</span>
            </a>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-slate-900 text-slate-500 text-xs py-8 text-center mt-auto">
        <p>© 2004-2026 TVCOUPON.CO.KR All rights reserved.</p>
    </footer>

    <!-- Clean Router Logic -->
    <script src="/deals_data.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const params = new URLSearchParams(window.location.search);
            const wrId = params.get('wr_id') || '1';
            const deals = window.TVCOUPON_DEALS || [];
            
            let deal = deals.find(d => String(d.idx) === String(wrId));
            if (!deal) {
                const numericId = parseInt(wrId.replace(/\D/g, '')) || 1;
                deal = deals[numericId % deals.length] || deals[0];
            }

            if (deal) {
                document.getElementById('page-title').innerText = `${deal.title} - TV쿠폰`;
                document.getElementById('deal-category').innerText = deal.category_name;
                document.getElementById('deal-date').innerText = deal.date;
                document.getElementById('deal-views').innerText = deal.views.toLocaleString();
                document.getElementById('deal-title').innerText = deal.title;
                
                if (deal.discount_percent > 0) {
                    document.getElementById('deal-discount').innerText = `${deal.discount_percent}%`;
                }
                document.getElementById('deal-price').innerText = `${deal.sale_price.toLocaleString()}원`;

                const contentBox = document.getElementById('deal-content');
                contentBox.innerHTML = `
                    <p class="text-slate-800 font-medium text-lg leading-relaxed">${deal.description}</p>
                    <p>본 혜택은 <strong>${deal.brand}</strong> 공식 파트너십을 통해 제공되는 100% 정품 모바일 인증 쿠폰입니다.</p>
                `;
            }
        });
    </script>
</body>
</html>
