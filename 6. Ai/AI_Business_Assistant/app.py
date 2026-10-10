import streamlit as st

st.set_page_config(
    page_title="AI Demand Forecasting Assistant",
    page_icon="📊",
    layout="centered"
)

st.title("📊 AI Demand Forecasting & Business Intelligence")
st.write(
    "Ask questions about the sales analysis "
    "and demand forecasting project."
)
st.caption(
    "AI answers are based on verified project findings "
    "and are intended for business analysis support."
)
# Load verified project knowledge
with open("business_knowledge.txt", "r", encoding="utf-8") as file:
    business_knowledge = file.read()


def answer_question(question):
    q = question.lower()

    if "store type" in q and (
        "sales per customer" in q
        or "sales/customer" in q
        or "highest" in q
    ):
        return (
            "Store Type D has the highest Sales per Customer "
            "at ₹11.25."
        )

    elif "promotion" in q or "promo" in q:
        return (
            "Promotional store-days had Sales per Customer of "
            "₹9.74 compared with ₹8.51 for non-promotional "
            "store-days, a difference of ₹1.23. This is a "
            "descriptive association and does not prove that "
            "promotions caused the increase."
        )

    elif "forecast" in q or "model" in q:
        return (
            "The Random Forest forecasting model achieved an "
            "MAE of approximately ₹451.00, RMSE of approximately "
            "₹688.30, and R² of approximately 0.9672 on the "
            "held-out test period."
        )

    elif "year" in q or "yoy" in q or "2014" in q:
        return (
            "Total sales in 2014 were approximately 5.30% lower "
            "than in 2013. 2015 was excluded from the full-year "
            "comparison because the dataset contains only "
            "January to July 2015."
        )

    elif "competition" in q or "distance" in q:
        return (
            "The 0–1 km competition-distance group had the "
            "highest average sales per store-day at ₹6,050.13. "
            "The 2–5 km group had the lowest at ₹5,529.88. "
            "This is an observed association, not proof of "
            "causation."
        )

    elif "season" in q or "month" in q:
        return (
            "December 2014 recorded the highest observed monthly "
            "average sales per store-day at ₹6,973.28, while "
            "January 2013 recorded the lowest at ₹5,211.56."
        )

    elif "monday" in q or "saturday" in q or "sunday" in q or "day" in q:
        return (
            "Among open store-days, Monday recorded the highest "
            "total sales. Sunday had the highest average sales "
            "per store-day, but it had far fewer observations."
        )

    elif "top store" in q or "best store" in q:
        return (
            "Among the top stores by total sales, Store 262 "
            "recorded the highest total sales at ₹19,516,842."
        )

    else:
        return (
            "I don't have enough information in the project "
            "knowledge base to answer that."
        )


with st.expander("💬 Suggested Questions"):
    st.write("• Which store type has the highest Sales per Customer?")
    st.write("• What was the impact of promotions?")
    st.write("• How accurate was the forecasting model?")
    st.write("• Which competition distance band performed best?")
    st.write("• What was the year-over-year sales trend?")

question = st.text_input(
    "Ask your business question:"
)

if st.button("Ask AI"):
    if question.strip():
        answer = answer_question(question)

        st.subheader("💡 AI Business Insight")
        st.write(answer)
    else:
        st.warning("Please enter a question.")