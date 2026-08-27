<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title id="page-title">TV쿠폰 게시판 - 실시간 할인 혜택</title>
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
                <span id="deal-category" class="px-2.5 py-0.5 rounded-full text-xs font-bold bg-rose-50 text-rose-600">쿠폰 게시판</span>
                <span id="deal-date" class="text-xs text-slate-400 font-semibold">2026.08.27</span>
                <span class="text-xs text-slate-400 ml-auto font-medium"><i class="far fa-eye mr-1"></i> 조회 <span id="deal-views">1,450</span></span>
            </div>

            <h1 id="deal-title" class="text-2xl sm:text-3xl font-black text-slate-900 leading-snug mb-6">
                쿠폰 및 게시글 상세 정보를 불러오는 중입니다...
            </h1>

            <div class="p-4 rounded-xl bg-slate-50 border border-slate-100 mb-8 flex flex-col sm:flex-row items-center justify-between gap-4">
                <div>
                    <span class="text-xs text-slate-400 font-semibold block mb-1">혜택 가격 정보</span>
                    <div class="flex items-baseline gap-2">
                        <span id="deal-discount" class="text-rose-600 font-black text-2xl"></span>
                        <span id="deal-price" class="text-slate-900 font-black text-2xl"></span>
                    </div>
                </div>
                <div id="deal-action-box">
                    <button class="px-6 py-3 rounded-xl bg-rose-600 hover:bg-rose-700 text-white font-bold text-sm shadow-md transition">
                        쿠폰 즉시 발급하기
                    </button>
                </div>
            </div>

            <div id="deal-content" class="prose max-w-none text-slate-700 leading-relaxed text-base space-y-4 mb-8">
                <!-- Content injected here -->
            </div>

            <!-- Partner Referral Box if applicable -->
            <div id="partner-box" class="hidden p-6 rounded-2xl bg-gradient-to-r from-amber-50 to-rose-50 border border-rose-200">
                <div class="flex items-center gap-2 mb-2">
                    <span class="px-2 py-0.5 rounded bg-rose-600 text-white text-[11px] font-bold">공식 제휴 프로모션</span>
                    <span class="text-xs text-rose-800 font-bold">2026년 8월 한정</span>
                </div>
                <h3 class="text-lg font-black text-slate-900 mb-2">빗썸 신규가입 7만원 현금성 웰컴 리워드</h3>
                <p class="text-xs text-slate-600 mb-4 leading-relaxed">
                    겟꿀(GETGGUL)과의 공식 파트너십을 통해 생애 최초 계좌 연결 및 거래 미션 완료 시 70,000원 전액 지급 혜택을 제공합니다.
                </p>
                <a href="https://getggul.com/guide/80k-event-guide.html" target="_blank" rel="noopener"
                   class="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl bg-slate-900 hover:bg-rose-600 text-white text-xs font-bold transition">
                    <span>겟꿀 공식 가이드 확인하기</span>
                    <i class="fas fa-external-link-alt text-[10px]"></i>
                </a>
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

    <!-- Router Logic -->
    <script src="/deals_data.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const params = new URLSearchParams(window.location.search);
            const wrId = params.get('wr_id') || '1';
            const deals = window.TVCOUPON_DEALS || [];
            
            // Find deal by index or wr_id hash
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
                    <p>본 쿠폰은 <strong>${deal.brand}</strong> 공식 가맹점 및 온라인 플랫폼에서 사용 가능한 모바일 인증 바코드 혜택입니다.</p>
                    <div class="bg-slate-50 p-4 rounded-xl border border-slate-200 my-4">
                        <h4 class="font-bold text-slate-800 text-sm mb-2"><i class="fas fa-info-circle text-rose-600 mr-1"></i> 이용 유의사항</h4>
                        <ul class="text-xs text-slate-600 space-y-1.5 list-disc list-inside">
                            <li>유효기간: 발급일로부터 90일 (기간 연장 가능)</li>
                            <li>환불 규정: 미사용 쿠폰 100% 전액 환불 보장</li>
                            <li>문의 사항: TV쿠폰 고객센터 및 제휴 브랜드 고객지원팀</li>
                        </ul>
                    </div>
                `;

                if (deal.is_partner || deal.partner_link) {
                    document.getElementById('partner-box').classList.remove('hidden');
                    const actionBox = document.getElementById('deal-action-box');
                    actionBox.innerHTML = `
                        <a href="${deal.partner_link || 'https://getggul.com/'}" target="_blank" rel="noopener"
                           class="px-6 py-3 rounded-xl bg-slate-900 hover:bg-rose-600 text-white font-bold text-sm shadow-md transition inline-block">
                            공식 혜택 바로가기 <i class="fas fa-arrow-right ml-1"></i>
                        </a>
                    `;
                }
            }
        });
    </script>
</body>
</html>
