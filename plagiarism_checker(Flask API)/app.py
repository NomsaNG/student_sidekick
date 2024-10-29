from flask import Flask, request, jsonify
import pandas as pd
import nltk
from your_streamlit_code import (get_text, get_sentences, get_similarity_list,
                                  get_similarity_list2)  # Import your existing functions

nltk.download('punkt')

app = Flask(__name__)

@app.route('/check_plagiarism', methods=['POST'])
def check_plagiarism():
    data = request.json
    text = data.get('text')
    urls = data.get('urls', [])

    # Process the text
    sentences = get_sentences(text)  # Ensure this function returns the sentences correctly
    similarity_list = get_similarity_list2(text, urls)  # Ensure this function works as intended

    # Create a DataFrame to return the results
    df = pd.DataFrame({'Sentence': sentences, 'URL': urls, 'Similarity': similarity_list})
    results = df.to_dict(orient='records')

    return jsonify(results)


if __name__ == '__main__':
    app.run(debug=True)
